//
//  MovieDetailViewModelTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import XCTest

@testable import PopularMoviesFeature

@available(iOS 17.0, *)
final class MovieDetailViewModelTests: XCTestCase {

    private var viewModel: MovieDetailViewModel!
    private var mockInteractor: MockMediaDetailInteractor!

    override func setUp() {
        super.setUp()

        mockInteractor = MockMediaDetailInteractor()
        viewModel = MovieDetailViewModel(interactor: mockInteractor, navigationTitle: "Test Movie", movieId: 1)
    }

    override func tearDown() {
        viewModel = nil
        mockInteractor = nil

        super.tearDown()
    }

    func test_fetch_media_detail_success_sets_loaded_state() async {
        let expectedDetail = MockWatchableDetail()
        mockInteractor.mockDetail = expectedDetail

        guard case .idle = viewModel.state  else {
            XCTFail("Expected state to be idle")
            return
        }

        await viewModel.fetchMediaDetail()

        if case let .loaded(detail) = viewModel.state {
            XCTAssertEqual(detail.genres.count, expectedDetail.genres.count)
            XCTAssertEqual(detail.title, expectedDetail.title)
        } else {
            XCTFail("Expected state to be loaded with details")
        }
    }

    func test_fetch_media_detail_failure_sets_failed_state() async {
        mockInteractor.error = NSError(domain: "TestError", code: 1, userInfo: nil)

        guard case .idle = viewModel.state  else {
            XCTFail("Expected state to be idle")
            return
        }

        await viewModel.fetchMediaDetail()

        if case let .failed(errorMessage) = viewModel.state {
            XCTAssertEqual(errorMessage, "The operation couldn’t be completed. (TestError error 1.)")
        } else {
            XCTFail("Expected state to be failed")
        }
    }
}
