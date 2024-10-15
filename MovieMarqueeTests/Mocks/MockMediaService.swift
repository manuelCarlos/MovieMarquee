//
//  MockMediaService.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import NetworkService
@testable import Models
@testable import MovieMarquee

final class MockMediaService: @unchecked Sendable, MediaService {

    var mockWatchables: [Watchable] = [MockWatchable()]
    var mockWatchableDetail: WatchableDetail = MockWatchableDetail()
    var mockCredits: Credits = Credits(cast: [Cast.make(id: 1, name: "Manuel Lopes"),
                                              Cast.make(id: 2, name: "Malo da Pro")],
                                       crew: [],
                                       id: 111)
    var shouldFail: Bool
    var fetchCount = 0

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetchMedia(request: NetworkService.NetworkRequest) async throws -> [MovieMarquee.Watchable] {
        fetchCount += 1
        if shouldFail {
            throw MockError.failure
        }
        return mockWatchables
    }

    func fetchMediaDetails(mediaId: Int) async throws -> MovieMarquee.WatchableDetail {
        if shouldFail {
            throw MockError.failure
        }
        return mockWatchableDetail
    }

    func fetchMediaCredits(mediaId: Int) async throws -> Models.Credits {
        if shouldFail {
            throw MockError.failure
        }
        return mockCredits
    }
}
