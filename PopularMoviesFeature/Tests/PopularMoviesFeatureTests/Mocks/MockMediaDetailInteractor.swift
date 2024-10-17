//
//  MockMediaDetailInteractor.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 13.10.24.
//

@testable import PopularMoviesFeature

final class MockMediaDetailInteractor: @unchecked Sendable, MediaDetailInteractor {

    var mockDetail: any WatchableDetail = MockWatchableDetail()
    var error: Error?
    var fetchGotCalled: Bool = false

    func fetchMovieDetail(movieId: Int) async throws -> any WatchableDetail {
        fetchGotCalled = true
        if let error {
            throw error
        } else {
            return mockDetail
        }
    }
}
