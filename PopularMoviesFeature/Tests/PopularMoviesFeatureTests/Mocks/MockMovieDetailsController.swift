//
//  MockMovieDetailsController.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 13.10.24.
//

@testable import Models
@testable import PopularMoviesFeature

final class MockMovieDetailsController: @unchecked Sendable, MediaDetailsController {

    var mockDetail: WatchableDetails = MockWatchableDetail()
    var error: Error?
    var fetchGotCalled: Bool = false

    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetails {
        fetchGotCalled = true
        if let error {
            throw error
        } else {
            return mockDetail
        }
    }
}
