//
//  MediaInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

// TODO: - Rename file and MediaInteractor

protocol MediaInteractor: Sendable {
    func fetchNextPopularPageAsFullList() async throws -> [Watchable]
}

final class DefaultMediaInteractor: Sendable, MediaInteractor {

    private let popularMoviesFetcher: Fetchable = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                                       service: MovieService.shared)

    func fetchNextPopularPageAsFullList() async throws -> [Watchable] {
        return try await popularMoviesFetcher.fetchWithNextPage()
    }
}
