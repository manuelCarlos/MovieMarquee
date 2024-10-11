//
//  DiscoverSceneViewModelTests.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import Models
@testable import MovieMarquee

final class DiscoverSceneViewModelTests: XCTestCase {

    private var mockInteractor: MockMediaInteractor!
    private let timeout = TimeInterval(2)

    override func setUp() {
        super.setUp()
        mockInteractor = MockMediaInteractor()
    }

    override func tearDown() {
        mockInteractor = nil
        super.tearDown()
    }

    func test_fetching_media_successfuly() async throws {
        let expectation = XCTestExpectation(description: "Fetch media async task completed")

        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockInteractor.fetchNextPopularPageAsFullListStub = mockMovies

        // Create the ViewModel with the mock interactor
        let viewModel = DiscoverSceneViewModel(interactor: mockInteractor)

        // Trigger media fetching
        viewModel.fetchMedia()
        expectation.fulfill()

        await fulfillment(of: [expectation], timeout: timeout)

        XCTAssertTrue(mockInteractor.fetchGotCalled)

        if case let .loaded(movies) = viewModel.state {
            XCTAssertEqual(movies.count, 2)
            XCTAssertEqual(movies.first?.id, 1)
            XCTAssertEqual(movies.first?.title, "Movie 1")
            XCTAssertEqual(movies.last?.id, 2)
            XCTAssertEqual(movies.last?.title, "Movie 2")
        } else {
            XCTFail("State should be loaded but is \(viewModel.state)")
        }
    }

    func test_fetching_media_should_fail() async throws {
        let mockError = NSError(domain: "test", code: 0, userInfo: nil)
        mockInteractor.error = mockError
        let viewModel = DiscoverSceneViewModel(interactor: mockInteractor)

        await viewModel.fetchMediaAsync()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "The operation couldn’t be completed. (test error 0.)")
        } else {
            XCTFail("State should be failed but is \(viewModel.state)")
        }
    }

    func test_fetching_media_should_return_an_empty_list_error() async throws {
        mockInteractor.fetchNextPopularPageAsFullListStub = []
        let viewModel = DiscoverSceneViewModel(interactor: mockInteractor)

        await viewModel.fetchMediaAsync()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "There are no popular movies available.")
        } else {
            XCTFail("State should be loaded with an empty list, but is \(viewModel.state)")
        }
    }
}
