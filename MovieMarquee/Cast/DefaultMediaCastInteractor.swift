//
//  DefaultMediaCastInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//

import Models

// TODO: - Rename file and MediaInteractor
protocol MediaCastInteractor {
    func fetchCast(mediaId: Int) async throws -> [Cast]
}

final class DefaultMediaCastInteractor: MediaCastInteractor {

    private let mediaService: MediaService

    init(mediaService: MediaService) {
        self.mediaService = mediaService
    }

    func fetchCast(mediaId: Int) async throws -> [Cast] {
        let credits = try await mediaService.fetchMediaCredits(mediaId: mediaId)
        return credits.cast
    }
}
