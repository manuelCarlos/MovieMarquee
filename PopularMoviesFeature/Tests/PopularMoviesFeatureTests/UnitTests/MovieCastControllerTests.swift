//
//  MovieCastControllerTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 16.0, *)
final class MovieCastControllerTests: XCTestCase {

    var mockMediaService: MockMediaService!
    var controller: MovieCastController!

    override func setUp() {
        super.setUp()

        mockMediaService = MockMediaService()
        controller = MovieCastController(mediaService: mockMediaService)
    }

    override func tearDown() {
        controller = nil

        super.tearDown()
    }

    func test_fetch_media_detail_successfully() async throws {
        let result = try await controller.fetchCast(mediaId: 1) as? [Cast]

        XCTAssertEqual(result?.first?.adult, false)
        XCTAssertEqual(result?.first?.character, "Main Character")
        XCTAssertEqual(result?.first?.creditId, "abc123")
        XCTAssertEqual(result?.first?.id, 1)
        XCTAssertEqual(result?.first?.name, "Manuel Lopes")
        XCTAssertEqual(result?.first?.order, 1)
    }

    func test_fetch_media_detail_failure() async {
        mockMediaService.shouldFail = true

        do {
            _ = try await controller.fetchCast(mediaId: 1)
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? MockError, MockError.failure)
        }
    }
}
