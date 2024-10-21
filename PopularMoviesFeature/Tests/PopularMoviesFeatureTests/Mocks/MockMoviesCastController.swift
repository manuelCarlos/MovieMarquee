//
//  MockMoviesCastController.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 21.10.24.
//

@testable import Models
@testable import PopularMoviesFeature

final class MockMoviesCastController: @unchecked Sendable, MediaCastController {

    var mockCasts: [Creditable] = []
    var error: Error?

    func fetchCast(mediaId: Int) async throws -> [Creditable] {
        if let error {
            throw error
        } else {
            return mockCasts
        }
    }
}
