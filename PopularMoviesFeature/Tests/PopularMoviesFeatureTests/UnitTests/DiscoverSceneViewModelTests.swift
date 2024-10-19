//
//  DiscoverSceneViewModelTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
final class DiscoverSceneViewModelTests: XCTestCase {

    private var mockController: MockMoviesOverviewController!
    private var viewModel: PopularMoviesFeatureViewModel!
    private let timeout = TimeInterval(2)

    override func setUp() {
        super.setUp()

        mockController = MockMoviesOverviewController()
        viewModel = PopularMoviesFeatureViewModel(controller: mockController)
    }

    override func tearDown() {
        mockController = nil

        super.tearDown()
    }

    func test_fetching_media_successfuly() async {
        let mockMovies = [Movie.make(id: 1, title: "Movie 1"), Movie.make(id: 2, title: "Movie 2")]
        mockController.fetchNextPopularPageAsFullListStub = mockMovies

        await viewModel.fetchPopularMoviesAsync()

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

    func test_fetching_media_should_fail() async {
        let mockError = NSError(domain: "test", code: 0, userInfo: nil)
        mockController.error = mockError

        await viewModel.fetchPopularMoviesAsync()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "The operation couldn’t be completed. (test error 0.)")
        } else {
            XCTFail("State should be failed but is \(viewModel.state)")
        }
    }

    func test_fetching_media_should_return_an_empty_list_error() async {
        mockController.fetchNextPopularPageAsFullListStub = []

        await viewModel.fetchPopularMoviesAsync()

        if case let .failed(error) = viewModel.state {
            XCTAssertEqual(error, "There are no popular movies available.")
        } else {
            XCTFail("State should be loaded with an empty list, but is \(viewModel.state)")
        }
    }
}
