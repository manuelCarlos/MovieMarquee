//
//  MediaFetcher.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Models
import NetworkService

@available(iOS 13.0, *)
final actor MediaFetcher: Fetchable {

    private var mediaList: [Watchable] = []
    private var pageCounter: Int = 0

    private var mediaListFetcher: MediaListFetcher
    private var mediaService: MediaService
    private var fetchTask: Task<[Watchable], Error>?

    init(mediaListFetcher: MediaListFetcher, service: MediaService) {
        self.mediaListFetcher = mediaListFetcher
        self.mediaService = service
    }

    func fetchNextPage() async throws -> [Watchable] {
        if fetchTask == nil {
            fetchTask = Task {
                pageCounter += 1
                return try await fetchWatchables()
            }
        } else {
            fetchTask?.cancel()
            pageCounter -= 1
        }

        defer { fetchTask = nil }

        let watchables = try await fetchTask?.value ?? []
        mediaList.append(contentsOf: watchables)
        return mediaList
    }

    // MARK: - Private

    private func fetchWatchables() async throws -> [Watchable] {
        let watchables: [Watchable] = try await mediaService.fetchMedia(request: mediaListFetcher.fetch(page: pageCounter))
        return watchables
    }
}
