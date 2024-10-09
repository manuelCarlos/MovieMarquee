//
//  PopularMoviesFetchTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import NetworkService

final class PopularMoviesFetchTests: XCTestCase {

    var popularMoviesFetcher: PopularMoviesFetcher!

    override func setUp() {
        super.setUp()
        popularMoviesFetcher = PopularMoviesFetcher()
    }

    override func tearDown() {
        popularMoviesFetcher = nil

        super.tearDown()
    }

    func test_fetch_popular_movies_creates_correct_request() {
        let request = popularMoviesFetcher.fetch(page: 1)

        XCTAssertEqual(request.path, "/movie/popular")
        XCTAssertEqual(request.requestType, .GET)
        XCTAssertEqual(request.urlParams["page"], "1")
        XCTAssertEqual(request.urlParams["language"], "en-US")
    }

    func test_fetch_popular_movies_contains_valid_url() {
        let request = popularMoviesFetcher.fetch(page: 2)

        XCTAssertEqual(request.urlParams["page"], "2")

        let urlRequest = try? request.makeRequest()
        XCTAssertNotNil(urlRequest)

        let url = urlRequest?.url?.absoluteString
        XCTAssertTrue(url?.contains("/movie/popular") ?? false)
        XCTAssertTrue(url?.contains("page=2") ?? false)
    }

    func test_fetch_popular_movies_contains_authorization_token() {
        let request = popularMoviesFetcher.fetch(page: 1)

        XCTAssertTrue(request.addAuthorizationToken)
    }
}
