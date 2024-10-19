//
//  MovieCastController.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import Models

protocol MediaCastController {
    func fetchCast(mediaId: Int) async throws -> [Cast]
}

@available(iOS 13.0, *)
final class MovieCastController: MediaCastController {

    private let mediaService: MediaService

    init(mediaService: MediaService) {
        self.mediaService = mediaService
    }

    func fetchCast(mediaId: Int) async throws -> [Cast] {
        let credits = try await mediaService.fetchMediaCredits(mediaId: mediaId)
        return credits.cast
    }
}
