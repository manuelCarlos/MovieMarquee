//
//  MediaFetcherTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import NetworkService
@testable import Models
@testable import PopularMoviesFeature

final class MediaFetcherTests: XCTestCase {

    func test_fetch_single_page_success() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result = try await fetcher.fetchSinglePage()

        XCTAssertEqual(result.count, mockService.mockWatchables.count)
        XCTAssertEqual(mockService.fetchCount, 1)
    }

    func test_fetch_single_page_failure() async throws {
        let mockService = MockMediaService(shouldFail: true)
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        do {
            _ = try await fetcher.fetchSinglePage()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertEqual((error as? MediaFetchError), .noPopularMoviesAvailable)
        }
    }

    func test_fetch_with_next_page_success() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result1 = try await fetcher.fetchWithNextPage()
        let result2 = try await fetcher.fetchWithNextPage()

        XCTAssertEqual(result1.count, 1)
        XCTAssertEqual(result2.count, 2)
        XCTAssertEqual(mockService.fetchCount, 2)
    }

    func test_fetch_with_next_page_failure() async throws {
        let mockService = MockMediaService(shouldFail: true)
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        do {
            _ = try await fetcher.fetchWithNextPage()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertEqual((error as? MediaFetchError), .noPopularMoviesAvailable)
        }
    }
}
