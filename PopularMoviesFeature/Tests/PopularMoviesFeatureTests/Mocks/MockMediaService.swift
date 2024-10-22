//
//  MockMediaService.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import NetworkService
@testable import Models
@testable import PopularMoviesFeature

final class MockMediaService: @unchecked Sendable, MediaService {

    var mockWatchables: [Watchable] = [Movie.make()]
    var mockWatchableDetail: WatchableDetails = MockWatchableDetail()
    var mockCredits: Credits = Credits(cast: [Cast.make(id: 1, name: "Manuel Lopes"),
                                              Cast.make(id: 2, name: "Malo da Pro")],
                                       crew: [],
                                       id: 111)
    var shouldFail: Bool
    var fetchCount = 0

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetchMedia(request: NetworkService.NetworkRequest) async throws -> [Watchable] {
        fetchCount += 1
        if shouldFail {
            throw MediaFetchError.noPopularMoviesAvailable
        }
        return mockWatchables
    }

    func fetchMediaDetails(mediaId: Int) async throws -> WatchableDetails {
        if shouldFail {
            throw NetworkError.invalidURL
        }
        return mockWatchableDetail
    }

    func fetchMediaCredits(mediaId: Int) async throws -> Models.Credits {
        if shouldFail {
            throw NetworkError.invalidURL
        }
        return mockCredits
    }
}
