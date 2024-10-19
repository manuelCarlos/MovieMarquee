//
//  MoviesOverviewControllerTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 11.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 16.0, *)
final class MoviesOverviewControllerTests: XCTestCase {

    var controller: MoviesOverviewController!
    var mockFetcher: MockFetchable!

    override func setUp() {
        super.setUp()

        mockFetcher = MockFetchable()
        controller = MoviesOverviewController(popularMoviesFetcher: mockFetcher)
    }

    override func tearDown() {
        controller = nil
        mockFetcher = nil

        super.tearDown()
    }

    func test_fetch_next_popular_page_as_full_list_success() async throws {
        let expectedWatchables = [Movie.make(id: 1), Movie.make(id: 2)]
        mockFetcher.mockResult = .success(expectedWatchables)

        let result = try await controller.fetchNextPopularPageAsFullList()

        XCTAssertEqual(result.count, expectedWatchables.count)
        XCTAssertEqual(result.first?.id, expectedWatchables.first?.id)
    }

    func test_fetch_next_popular_page_as_full_list_failure() async throws {
        mockFetcher.mockResult = .failure(MockError.failure)

        do {
            _ = try await controller.fetchNextPopularPageAsFullList()
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? MockError, MockError.failure)
        }
    }
}
