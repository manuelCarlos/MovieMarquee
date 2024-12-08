//
//  MovieDetailsController.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Models

@available(iOS 13.0, *)
protocol MediaDetailsController: Sendable {
    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetails
}

@available(iOS 16.0, *)
final class MovieDetailsController: Sendable, MediaDetailsController {

    private let movieService: MediaService

    init(movieService: MediaService) {
        self.movieService = movieService
    }

    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetails {
        return try await movieService.fetchMediaDetails(mediaId: movieId)
    }
}
