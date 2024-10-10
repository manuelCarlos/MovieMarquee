//
//  MediaFetcherTests.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import NetworkService
@testable import Models
@testable import MovieMarquee

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
            XCTAssertTrue(error is MockError)
        }
    }

    func test_fetch_with_next_page_success() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result1 = try await fetcher.fetchWithNextPage()
        let result2 = try await fetcher.fetchWithNextPage()

        XCTAssertEqual(result1.count, mockService.mockWatchables.count)
        XCTAssertEqual(result2.count, mockService.mockWatchables.count * 2)
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
            XCTAssertTrue(error is MockError)
        }
    }
}
