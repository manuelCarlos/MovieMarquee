//
//  MockRequestManager.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//
// swiftlint:disable force_cast

@testable import NetworkService
@testable import Models
@testable import PopularMoviesFeature

final class MockRequestManager: @unchecked Sendable, RequestManagerProtocol {
    var mockMedia: Movies?
    var mockMediaDetail: WatchableDetails?
    var mockMediaCast: Credits?
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

        if let mockMediaDetail {
            return mockMediaDetail as! T
        }
        if let mockMediaCast {
            return mockMediaCast as! T
        }
        return mockMedia as! T
    }

    var apiManager: APIManagerProtocol {
        fatalError("Not needed for this mock")
    }

    var parser: DataParser {
        fatalError("Not needed for this mock")
    }
}
// swiftlint:enable force_cast
