//
//  MockMediaInteractor.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import Models
@testable import PopularMoviesFeature

final class MockMediaInteractor: @unchecked Sendable, MediaInteractor {

    var fetchNextPopularPageAsFullListStub: [Watchable] = []
    var error: Error?

    func fetchNextPopularPageAsFullList() async throws -> [Watchable] {
        if let error {
            throw error
        } else {
            return fetchNextPopularPageAsFullListStub
        }
    }
}
