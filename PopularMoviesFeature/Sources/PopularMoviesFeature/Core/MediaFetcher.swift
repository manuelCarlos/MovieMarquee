//
//  MediaFetcher.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import os.log

import Models
import NetworkService

@available(iOS 14.0, *)
final actor MediaFetcher: Fetchable {

    private var mediaList: [Watchable] = []
    private(set) var pageNumber: Int = 0

    private let logger = Logger(subsystem: "PopularMoviesFeature.Package", category: "MediaFetcher")
    private let mediaListFetcher: MediaListFetcher
    private let mediaService: MediaService
    private var fetchTask: Task<[Watchable], Error>?

    init(mediaListFetcher: MediaListFetcher, service: MediaService) {
        self.mediaListFetcher = mediaListFetcher
        self.mediaService = service
    }

    func fetchNextPage() async throws -> [Watchable] {
        if fetchTask == nil {
            fetchTask = Task {
                pageNumber += 1
                return try await fetchWatchables()
            }
        } else {
            fetchTask?.cancel()
            pageNumber -= 1
        }

        defer { fetchTask = nil }

        return try await processedTaskResult(from: fetchTask)
    }

    // MARK: - Private

    private func fetchWatchables() async throws -> [Watchable] {
        let watchables: [Watchable] = try await mediaService.fetchMedia(with: mediaListFetcher.fetchRequestComponents(page: pageNumber))
        return watchables
    }

    private func processedTaskResult(from fetchTask: Task<[Watchable], Error>?) async throws -> [Watchable] {
        guard let fetchTask else {
            assertionFailure("Oops. There is no fetch task, this should not happen.")
            logger.fault("Oops. There is no fetch task, this should not happen.")
            return mediaList
        }
        let result = await fetchTask.result
        switch result {
        case .success(let watchables):
            // The for loop where cause prevent from storing duplicate movies, This can happen because the BE API sometimes
            // includes the last movie from the previous page as the 1st movie of the next page 🙃.
            for watchable in watchables where mediaList.contains(where: { $0.id == watchable.id }) == false {
                mediaList.append(watchable)
            }
            logger.debug("Fetched 🐳 \(watchables.count) watchables, in page: \(self.pageNumber)")
            return mediaList
        case .failure(let error):
            pageNumber -= 1
            throw error
        }
    }
}
