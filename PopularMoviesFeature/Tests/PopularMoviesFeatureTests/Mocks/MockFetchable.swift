//
//  MockFetchable.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 11.10.24.
//

import XCTest

@testable import PopularMoviesFeature

final class MockFetchable: @unchecked Sendable, Fetchable {

    var mockResult: Result<[any Watchable], Error>!

    func fetchSinglePage() async throws -> [any Watchable] {
        switch mockResult {
        case .success(let watchables):
            return watchables
        case .failure(let error):
            throw error
        case .none:
            XCTFail("Mock result not set")
            return []
        }
    }

    func fetchWithNextPage() async throws -> [any Watchable] {
        switch mockResult {
        case .success(let watchables):
            return watchables
        case .failure(let error):
            throw error
        case .none:
            XCTFail("Mock result not set")
            return []
        }
    }
}
