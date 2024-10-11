//
//  MockRequestManager.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import NetworkService
@testable import Models

final class MockRequestManager: @unchecked Sendable, RequestManagerProtocol {
    var mockMovies: Movies
    var shouldFail: Bool
    var decodeCallCount = 0

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.mockMovies = Movies(
            dates: nil,
            page: 1,
            results: [Movie.make(id: 1)],
            totalPages: 1,
            totalResults: 1
        )
    }

    func decode<T: Decodable>(networkRequest data: NetworkRequest) async throws -> T {
        decodeCallCount += 1
        if shouldFail {
            throw MockError.failure
        }
        return mockMovies as! T // swiftlint:disable:this force_cast
    }

    var apiManager: APIManagerProtocol {
        fatalError("Not needed for this mock")
    }

    var parser: DataParser {
        fatalError("Not needed for this mock")
    }
}
