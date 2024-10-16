//
//  MediaFetcher.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

final actor MediaFetcher: Fetchable {

    private var mediaList: [Watchable] = []
    private var pageCounter: Int = 0

    private var mediaListfetcher: MediaListFetcher
    private var mediaService: MediaService

    init(mediaListFetcher: MediaListFetcher, service: MediaService) {
        self.mediaListfetcher = mediaListFetcher
        self.mediaService = service
    }

    func fetchSinglePage() async throws -> [Watchable] {
        let watchables: [Watchable] = try await mediaService.fetchMedia(request: mediaListfetcher.fetch(page: pageCounter))
        return watchables
    }

    func fetchWithNextPage() async throws -> [Watchable] {
        pageCounter += 1
        let watchables = try await fetchSinglePage()
        mediaList.append(contentsOf: watchables)
        return mediaList
    }
}
