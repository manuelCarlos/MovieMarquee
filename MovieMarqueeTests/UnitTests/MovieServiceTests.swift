//
//  MovieServiceTests.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import Models
@testable import MovieMarquee

final class MovieServiceTests: XCTestCase {

    private let mockMovies = Movies.make()

    func test_fetch_media_successfuly() async throws {
        let mockRequestManager = MockRequestManager()
        mockRequestManager.mockMovies = mockMovies
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        let watchables = try await service.fetchMedia(request: mockRequest)

        XCTAssertEqual(watchables.count, mockRequestManager.mockMovies?.results.count)
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_failure() async throws {
        let mockRequestManager = MockRequestManager(shouldFail: true)
        mockRequestManager.mockMovies = mockMovies
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        do {
            _ = try await service.fetchMedia(request: mockRequest)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertTrue(error is MockError)
        }
    }

    // MARK: - Tests for fetchMediaDetails

    func test_fetch_media_details_successfully() async throws {
        let mockRequestManager = MockRequestManager()
        mockRequestManager.mockMovieDetail = MovieDetail.make()
        let service = MovieService(requestManager: mockRequestManager)
        let movieID = 123 // Mock movie ID

        let movieDetail = try await service.fetchMediaDetails(mediaId: movieID)

        XCTAssertEqual(movieDetail.id, 12)
        XCTAssertEqual(movieDetail.title, "The cookie monster")
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_details_failure() async throws {
        let mockRequestManager = MockRequestManager(shouldFail: true)
        mockRequestManager.mockMovieDetail = MovieDetail.make()
        let service = MovieService(requestManager: mockRequestManager)
        let movieID = 123 // Mock movie ID

        do {
            _ = try await service.fetchMediaDetails(mediaId: movieID)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertTrue(error is MockError)
        }
    }
}
