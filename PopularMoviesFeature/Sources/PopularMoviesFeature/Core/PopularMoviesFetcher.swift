//
//  PopularMoviesFetcher.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 20.10.24.
//

import NetworkService

final class PopularMoviesFetcher: Sendable, MediaListFetcher {

    func fetchRequestComponents(page: Int) -> RequestComponents {
        MovieRequest.getPopularMovies(page: page)
    }
}
