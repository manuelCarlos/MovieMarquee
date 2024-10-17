//
//  MediaFetcher.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

@available(iOS 13.0, *)
final actor MediaFetcher: Fetchable {

    private var mediaList: [any Watchable] = []
    private var pageCounter: Int = 0

    private var mediaListFetcher: MediaListFetcher
    private var mediaService: MediaService

    init(mediaListFetcher: MediaListFetcher, service: MediaService) {
        self.mediaListFetcher = mediaListFetcher
        self.mediaService = service
    }

    func fetchSinglePage() async throws -> [any Watchable] {
        let watchables: [any Watchable] = try await mediaService.fetchMedia(request: mediaListFetcher.fetch(page: pageCounter))
        return watchables
    }

    func fetchWithNextPage() async throws -> [any Watchable] {
        pageCounter += 1
        let watchables = try await fetchSinglePage()
        mediaList.append(contentsOf: watchables)
        return mediaList
    }
}
