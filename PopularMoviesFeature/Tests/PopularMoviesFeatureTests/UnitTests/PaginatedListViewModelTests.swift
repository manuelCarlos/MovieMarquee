//
//  PaginatedListViewModelTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 11.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
final class PaginatedListViewModelTests: XCTestCase {

    private var mockController: MockMoviesOverviewController!
    private var viewModel: PaginatedListViewModel!

    override func setUp() {
        super.setUp()

        mockController = MockMoviesOverviewController()
        viewModel = PaginatedListViewModel(controller: mockController)
    }

    override func tearDown() {
        mockController = nil
        viewModel = nil

        super.tearDown()
    }

    func test_fetching_first_page_successfully() async {
        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockController.fetchNextPopularPageAsFullListStub = mockMovies

        await viewModel.fetchFirstPage()

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

    func test_fetch_additional_pages_successfully() async throws {
        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockController.fetchNextPopularPageAsFullListStub = mockMovies

        try await viewModel.fetchMedia()

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

    func test_fetching_additional_pages_should_not_throw_an_error_when_an_empty_list_is_returned() async throws {
        mockController.fetchNextPopularPageAsFullListStub = []

        try await viewModel.fetchMedia()

        if case let .loaded(movies) = viewModel.state {
            XCTAssertEqual(movies.count, 0)
        } else {
            XCTFail("State should be loaded but is \(viewModel.state)")
        }
    }

    func test_fetching_first_page_should_throw_an_error() async {
        let mockError = NSError(domain: "test", code: 0, userInfo: nil)
        mockController.error = mockError

        await viewModel.fetchFirstPage()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "The operation couldn’t be completed. (test error 0.)")
        } else {
            XCTFail("State should be failed but is \(viewModel.state)")
        }
    }

    func test_fetching_first_page_should_return_an_empty_list_error() async {
        mockController.fetchNextPopularPageAsFullListStub = []

        await viewModel.fetchFirstPage()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "There are no popular movies available.")
        } else {
            XCTFail("State should be loaded with an empty list, but is \(viewModel.state)")
        }
    }
}
