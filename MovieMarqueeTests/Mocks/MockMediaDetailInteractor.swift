//
//  MockMediaDetailInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 13.10.24.
//

@testable import MovieMarquee

final class MockMediaDetailInteractor: @unchecked Sendable, MediaDetailInteractor {

    var mockDetail: WatchableDetail = MockWatchableDetail()
    var error: Error?
    var fetchGotCalled: Bool = false

    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetail {
        fetchGotCalled = true
        if let error {
            throw error
        } else {
            return mockDetail
        }
    }
}
