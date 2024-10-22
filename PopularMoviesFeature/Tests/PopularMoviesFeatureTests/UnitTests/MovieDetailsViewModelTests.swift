//
//  MovieDetailsViewModelTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import XCTest

@testable import PopularMoviesFeature

@available(iOS 17.0, *)
final class MovieDetailsViewModelTests: XCTestCase {

    private var viewModel: MovieDetailsViewModel!
    private var mockController: MockMovieDetailsController!

    override func setUp() {
        super.setUp()

        mockController = MockMovieDetailsController()
        viewModel = MovieDetailsViewModel(controller: mockController, navigationTitle: "Test Movie", movieId: 1)
    }

    override func tearDown() {
        viewModel = nil
        mockController = nil

        super.tearDown()
    }

    func test_fetch_media_details_success_sets_loaded_state() async {
        let expectedDetail = MockWatchableDetail()
        mockController.mockDetail = expectedDetail

        guard case .idle = viewModel.state  else {
            XCTFail("Expected state to be idle")
            return
        }

        await viewModel.fetchMediaDetails()

        if case let .loaded(detail) = viewModel.state {
            XCTAssertEqual(detail.genres.count, 1)
            XCTAssertEqual(detail.title, "Mock Movie")
        } else {
            XCTFail("Expected state to be loaded with details")
        }
    }

    func test_fetch_media_details_failure_sets_failed_state() async {
        mockController.error = NSError(domain: "TestError", code: 1, userInfo: nil) // TODO: - custom errror

        guard case .idle = viewModel.state  else {
            XCTFail("Expected state to be idle")
            return
        }

        await viewModel.fetchMediaDetails()

        if case let .failed(errorMessage) = viewModel.state {
            XCTAssertEqual(errorMessage, "The operation couldn’t be completed. (TestError error 1.)")
        } else {
            XCTFail("Expected state to be failed")
        }
    }
}
