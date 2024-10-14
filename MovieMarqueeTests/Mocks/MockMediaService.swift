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

    var mockWatchables: [Watchable]
    var mockWatchableDetail: WatchableDetail = MockWatchableDetail()
    var shouldFail: Bool
    var fetchCount = 0

    init(shouldFail: Bool = false, mockWatchables: [Watchable] = [MockWatchable()]) {
        self.shouldFail = shouldFail
        self.mockWatchables = mockWatchables
    }

    func fetchMedia(request: NetworkService.NetworkRequest) async throws -> [MovieMarquee.Watchable] {
        fetchCount += 1
        if shouldFail {
            throw MockError.failure
        }
        return mockWatchables
    }

    func fetchMediaDetails(mediaId: Int) async throws -> any MovieMarquee.WatchableDetail {
        return mockWatchableDetail
    }

    func fetchMediaCredits(id: Int) async throws -> Models.Credits? {
        return nil
    }
}
