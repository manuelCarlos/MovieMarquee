//
//  MediaListViewModelTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 11.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
final class MediaListViewModelTests: XCTestCase {

    private var mockInteractor: MockMediaInteractor!
    private var viewModel: MediaListViewModel!
    private let timeout = TimeInterval(2)

    override func setUp() {
        super.setUp()

        mockInteractor = MockMediaInteractor()
        viewModel = MediaListViewModel(interactor: mockInteractor, section: .popularMovies)
    }

    override func tearDown() {
        mockInteractor = nil
        viewModel = nil

        super.tearDown()
    }

    func test_fetching_first_page_successfuly() async {
        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockInteractor.fetchNextPopularPageAsFullListStub = mockMovies

        // Trigger media fetching
        await viewModel.fetchfirstPage()

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

    func test_fetch_additional_pages_successfuly() async throws {
        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockInteractor.fetchNextPopularPageAsFullListStub = mockMovies

        // Trigger media fetching
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
        mockInteractor.fetchNextPopularPageAsFullListStub = []

        // Trigger media fetching
        try await viewModel.fetchMedia()

        if case let .loaded(movies) = viewModel.state {
            XCTAssertEqual(movies.count, 0)
        } else {
            XCTFail("State should be loaded but is \(viewModel.state)")
        }
    }

    func test_fetching_first_page_should_throw_an_error() async {
        let mockError = NSError(domain: "test", code: 0, userInfo: nil)
        mockInteractor.error = mockError

        await viewModel.fetchfirstPage()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "The operation couldn’t be completed. (test error 0.)")
        } else {
            XCTFail("State should be failed but is \(viewModel.state)")
        }
    }

    func test_fetching_first_page_should_return_an_empty_list_error() async {
        mockInteractor.fetchNextPopularPageAsFullListStub = []

        await viewModel.fetchfirstPage()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "There are no popular movies available.")
        } else {
            XCTFail("State should be loaded with an empty list, but is \(viewModel.state)")
        }
    }
}
