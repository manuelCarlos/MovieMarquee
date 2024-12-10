//
//  MediaFetcherTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 14.0, *)
final class MediaFetcherTests: XCTestCase {

    func test_first_page_fetch_successfully() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result = try await fetcher.fetchNextPage()

        XCTAssertEqual(result.count, mockService.mockWatchables.count)
        XCTAssertEqual(mockService.fetchCount, 1)
        let page = await fetcher.pageNumber
        XCTAssertEqual(page, 2)
    }

    func test_first_page_fetch_failure() async throws {
        let mockService = MockMediaService(shouldFail: true)
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        do {
            _ = try await fetcher.fetchNextPage()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertEqual((error as? MediaServiceError), .noPopularMoviesAvailable)
            let page = await fetcher.pageNumber
            XCTAssertEqual(page, 1)
        }
    }

    func test_fetch_two_consecutive_pages_successfully() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result1 = try await fetcher.fetchNextPage()
        mockService.mockWatchables = [
            Movie.make(id: 222)
        ]
        let result2 = try await fetcher.fetchNextPage()

        XCTAssertEqual(result1.count, 1)
        XCTAssertEqual(result2.count, 2)
        XCTAssertEqual(mockService.fetchCount, 2)
        let page = await fetcher.pageNumber
        XCTAssertEqual(page, 3)
    }

    func test_page_number_should_be_one_after_initial_two_consecutive_pages_fail() async throws {
        let mockService = MockMediaService(shouldFail: true)
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        _ = try? await fetcher.fetchNextPage()
        mockService.mockWatchables = [
            Movie.make(id: 222)
        ]
        _ = try? await fetcher.fetchNextPage()

        let page = await fetcher.pageNumber
        XCTAssertEqual(page, 1)
    }

    func test_page_number_should_be_three_when_a_third_fetch_task_fails() async throws {
        let mockService = MockMediaService()
        let mockFetcher = MockMediaListFetcher()
        let fetcher = MediaFetcher(mediaListFetcher: mockFetcher, service: mockService)

        let result1 = try await fetcher.fetchNextPage()
        mockService.mockWatchables = [
            Movie.make(id: 222)
        ]
        let result2 = try await fetcher.fetchNextPage()

        XCTAssertEqual(result1.count, 1)
        XCTAssertEqual(result2.count, 2)
        XCTAssertEqual(mockService.fetchCount, 2)
        let page = await fetcher.pageNumber
        XCTAssertEqual(page, 3)

        mockService.shouldFail = true

        do {
            _ = try await fetcher.fetchNextPage()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertEqual((error as? MediaServiceError), .noPopularMoviesAvailable)
            let page = await fetcher.pageNumber
            XCTAssertEqual(page, 3)
        }
    }
}
