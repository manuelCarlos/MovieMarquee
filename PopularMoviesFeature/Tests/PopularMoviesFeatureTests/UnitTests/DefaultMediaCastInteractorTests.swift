//
//  DefaultMediaCastInteractorTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import PopularMoviesFeature

final class DefaultMediaCastInteractorTests: XCTestCase {

    var mockMediaService: MockMediaService!
    var interactor: DefaultMediaCastInteractor!

    override func setUp() {
        super.setUp()

        mockMediaService = MockMediaService()
        interactor = DefaultMediaCastInteractor(mediaService: mockMediaService)
    }

    override func tearDown() {
        interactor = nil

        super.tearDown()
    }

    func test_fetch_media_detail_successfuly() async throws {
        let result = try await interactor.fetchCast(mediaId: 1)

        XCTAssertEqual(result.first?.adult, false)
    }

    func test_fetch_media_detail_failure() async {
        mockMediaService.shouldFail = true

        do {
            _ = try await interactor.fetchCast(mediaId: 1)
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? MockError, MockError.failure)
        }
    }
}
