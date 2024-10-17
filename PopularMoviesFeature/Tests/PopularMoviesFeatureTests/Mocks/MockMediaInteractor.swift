//
//  MockMediaInteractor.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import PopularMoviesFeature

final class MockMediaInteractor: @unchecked Sendable, MediaInteractor {

    var fetchNextPopularPageAsFullListStub: [any Watchable] = []
    var error: Error?

    func fetchNextPopularPageAsFullList() async throws -> [any Watchable] {
        if let error {
            throw error
        } else {
            return fetchNextPopularPageAsFullListStub
        }
    }
}
