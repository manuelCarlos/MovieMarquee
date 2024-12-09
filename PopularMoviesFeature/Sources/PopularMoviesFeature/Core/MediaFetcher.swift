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
    private var pageNumber: Int = 0

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

        guard let fetchTask else {
            assertionFailure("Oops. There is no fetch task, this should not happen.")
            logger.error("Oops. There is no fetch task, this should not happen.")
            return mediaList
        }
        let watchables = try await fetchTask.value
        for watchable in watchables where mediaList.contains(where: { $0.id == watchable.id }) == false {
            mediaList.append(watchable)
        }
        return mediaList
    }

    // MARK: - Private

    private func fetchWatchables() async throws -> [Watchable] {
        let watchables: [Watchable] = try await mediaService.fetchMedia(with: mediaListFetcher.fetchRequestComponents(page: pageNumber))
        return watchables
    }
}
