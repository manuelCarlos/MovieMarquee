//
//  PopularMoviesFetcher.swift
//  NetworkService
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public final class PopularMoviesFetcher: Sendable, MediaListFetcher {

    public init() {}

    public func fetch(page: Int) -> NetworkRequest {
        MovieRequest.getPopularMovies(page: page)
    }
}
