//
//  MockMediaInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import MovieMarquee

// Define a mock MediaInteractor that conforms to the MediaInteractor protocol
final class MockMediaInteractor: @unchecked Sendable, MediaInteractor {
    var fetchNextPopularPageAsFullListStub: [Watchable] = []
    var fetchGotCalled: Bool = false
    var error: Error?

    // This method simulates the fetchNextPopularPageAsFullList() behavior.
    func fetchNextPopularPageAsFullList() async throws -> [Watchable] {
        fetchGotCalled = true
        if let error {
            throw error
        } else {
            return fetchNextPopularPageAsFullListStub
        }
    }
}
