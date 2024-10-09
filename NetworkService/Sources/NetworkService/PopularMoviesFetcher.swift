//
//  PopularMoviesFetcher.swift
//  NetworkService
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

final class PopularMoviesFetcher: MediaListFetcher {
    func fetch(page: Int) -> NetworkRequest {
        MovieRequest.getPopularMovies(page: page)
    }
}
