//
//  MoviesOverviewController.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Models
import NetworkService

@available(iOS 13.0, *)
protocol MediaOverviewController: Sendable {
    func fetchPopularMoviesNextPage() async throws -> [Watchable]
}

@available(iOS 16.0, *)
final class MoviesOverviewController: Sendable, MediaOverviewController {

    private let popularMoviesFetcher: Fetchable

    init(popularMoviesFetcher: Fetchable = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                                        service: MovieService.shared)) {
        self.popularMoviesFetcher = popularMoviesFetcher
    }

    func fetchPopularMoviesNextPage() async throws -> [Watchable] {
        return try await popularMoviesFetcher.fetchNextPage()
    }
}
