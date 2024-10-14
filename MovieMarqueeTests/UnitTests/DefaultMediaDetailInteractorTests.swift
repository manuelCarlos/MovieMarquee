//
//  DefaultMediaDetailInteractor.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import MovieMarquee

final class DefaultMediaDetailInteractorTests: XCTestCase {

    var mockMediaService: MockMediaService!
    var interactor: DefaultMediaDetailInteractor!

    override func setUp() {
        super.setUp()

        mockMediaService = MockMediaService()
        interactor = DefaultMediaDetailInteractor(movieService: mockMediaService)
    }

    override func tearDown() {
        interactor = nil

        super.tearDown()
    }

    func test_fetch_media_detail_successfuly() async throws {
        let expectedWatchableDetail = MockWatchableDetail()
        mockMediaService.mockWatchableDetail = expectedWatchableDetail

        let result = try await interactor.fetchMovieDetail(movieId: 1)

        XCTAssertEqual(result.posterPath, "/path/to/mock_poster.jpg")
        XCTAssertEqual(result.tagline, "A thrilling adventure")
        XCTAssertEqual(result.title, "Mock Movie")
        XCTAssertEqual(result.voteAverage, 7.5)
        XCTAssertEqual(result.overview, "This is a mock movie used for testing purposes.")
    }

    func test_fetch_media_detail_failure() async {
        mockMediaService.shouldFail = true

        do {
            _ = try await interactor.fetchMovieDetail(movieId: 1)
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? MockError, MockError.failure)
        }
    }
}
