//
//  MockRequestManager.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//
// swiftlint:disable force_cast

@testable import NetworkService
@testable import Models

final class MockRequestManager: @unchecked Sendable, RequestManagerProtocol {
    var mockMovies: Movies?
    var mockMovieDetail: MovieDetail?
    var shouldFail: Bool
    var decodeCallCount = 0

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func decode<T: Decodable>(networkRequest data: NetworkRequest) async throws -> T {
        decodeCallCount += 1
        if shouldFail {
            throw MockError.failure
        }

        if let mockMovieDetail {
            return mockMovieDetail as! T
        }
        return mockMovies as! T
    }

    var apiManager: APIManagerProtocol {
        fatalError("Not needed for this mock")
    }

    var parser: DataParser {
        fatalError("Not needed for this mock")
    }
}
// swiftlint:enable force_cast
