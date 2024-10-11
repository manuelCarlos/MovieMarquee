//
//  DefaultMediaInteractorTests.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 11.10.24.
//

import XCTest

@testable import MovieMarquee

final class DefaultMediaInteractorTests: XCTestCase {
    
    var interactor: DefaultMediaInteractor!
    var mockFetcher: MockFetchable!
    
    override func setUp() {
        super.setUp()
        mockFetcher = MockFetchable()
        interactor = DefaultMediaInteractor(popularMoviesFetcher: mockFetcher)
    }
    
    override func tearDown() {
        interactor = nil
        mockFetcher = nil
        super.tearDown()
    }
    
    func test_fetch_next_popular_page_as_full_list_success() async throws {
        let expectedWatchables = [MockWatchable(id: 1), MockWatchable(id: 2)]
        mockFetcher.mockResult = .success(expectedWatchables)
        
        let result = try await interactor.fetchNextPopularPageAsFullList()
        
        XCTAssertEqual(result.count, expectedWatchables.count)
        XCTAssertEqual(result.first?.id, expectedWatchables.first?.id)
    }
    
    func test_fetch_next_popular_page_as_full_list_failure() async throws {
        mockFetcher.mockResult = .failure(MockError.failure)
        
        do {
            _ = try await interactor.fetchNextPopularPageAsFullList()
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? MockError, MockError.failure)
        }
    }
}
