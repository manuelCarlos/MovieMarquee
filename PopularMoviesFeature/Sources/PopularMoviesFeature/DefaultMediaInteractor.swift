//
//  DefaultMediaInteractor.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

// TODO: - Rename file and MediaInteractor

@available(iOS 13.0, *)
protocol MediaInteractor: Sendable {
    func fetchNextPopularPageAsFullList() async throws -> [any Watchable]
}

@available(iOS 16.0, *)
final class DefaultMediaInteractor: Sendable, MediaInteractor {

    private let popularMoviesFetcher: Fetchable
    
    init(popularMoviesFetcher: Fetchable = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                                        service: MovieService.shared)) {
        self.popularMoviesFetcher = popularMoviesFetcher
    }

    func fetchNextPopularPageAsFullList() async throws -> [any Watchable] {
        return try await popularMoviesFetcher.fetchWithNextPage()
    }
}
