//
//  MovieServiceTests.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import MovieMarquee

final class MovieServiceTests: XCTestCase {

    func test_fetch_media_successfuly() async throws {
        let mockRequestManager = MockRequestManager()
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        let watchables = try await service.fetchMedia(request: mockRequest)

        XCTAssertEqual(watchables.count, mockRequestManager.mockMovies.results.count)
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_failure() async throws {
        let mockRequestManager = MockRequestManager(shouldFail: true)
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        do {
            _ = try await service.fetchMedia(request: mockRequest)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertTrue(error is MockError)
        }
    }
}
