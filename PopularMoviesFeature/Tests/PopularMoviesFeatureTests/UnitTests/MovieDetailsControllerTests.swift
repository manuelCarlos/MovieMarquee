//
//  MovieDetailsControllerTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import PopularMoviesFeature
@testable import NetworkService

@available(iOS 16.0, *)
final class MovieDetailsControllerTests: XCTestCase {

    var mockMediaService: MockMediaService!
    var controller: MovieDetailsController!

    override func setUp() {
        super.setUp()

        mockMediaService = MockMediaService()
        controller = MovieDetailsController(movieService: mockMediaService)
    }

    override func tearDown() {
        controller = nil

        super.tearDown()
    }

    func test_fetch_media_details_successfully() async throws {
        let expectedWatchableDetail = MockWatchableDetail()
        mockMediaService.mockWatchableDetail = expectedWatchableDetail

        let result = try await controller.fetchMovieDetail(movieId: 1)

        XCTAssertEqual(result.posterPath, "/path/to/mock_poster.jpg")
        XCTAssertEqual(result.tagline, "A thrilling adventure")
        XCTAssertEqual(result.title, "Mock Movie")
        XCTAssertEqual(result.voteAverage, 7.5)
        XCTAssertEqual(result.overview, "This is a mock movie used for testing purposes.")
    }

    func test_fetch_media_details_failure() async {
        mockMediaService.shouldFail = true

        do {
            _ = try await controller.fetchMovieDetail(movieId: 1)
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? NetworkError, .invalidURL)
        }
    }
}
