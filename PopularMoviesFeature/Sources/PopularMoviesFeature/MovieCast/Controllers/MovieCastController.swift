//
//  MovieCastController.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import Models

@available(iOS 13.0, *)
protocol MediaCastController {
    func fetchCast(mediaId: Int) async throws -> [Creditable]
}

@available(iOS 16.0, *)
final class MovieCastController: MediaCastController {

    private let movieService: MediaService

    init(movieService: MediaService) {
        self.movieService = movieService
    }

    func fetchCast(mediaId: Int) async throws -> [Creditable] {
        let credits = try await movieService.fetchMediaCredits(mediaId: mediaId)
        return credits.cast
    }
}
