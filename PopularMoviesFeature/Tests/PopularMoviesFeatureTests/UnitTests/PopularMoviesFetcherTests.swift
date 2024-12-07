//
//  PopularMoviesFetchTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 20.10.24.
//

import XCTest

@testable import NetworkService
@testable import PopularMoviesFeature

final class PopularMoviesFetcherTests: XCTestCase {

    private var popularMoviesFetcher: PopularMoviesFetcher!

    override func setUp() {
        super.setUp()

        popularMoviesFetcher = PopularMoviesFetcher()
    }

    override func tearDown() {
        popularMoviesFetcher = nil

        super.tearDown()
    }

    func test_fetch_popular_movies_creates_correct_request() {
        let components = popularMoviesFetcher.fetchRequestComponents(page: 1)

        XCTAssertEqual(components.path, "/movie/popular")
        XCTAssertEqual(components.requestType, .get)
        XCTAssertEqual(components.urlParams["page"], "1")
        XCTAssertEqual(components.urlParams["language"], "en-US")
    }

    func test_fetch_popular_movies_contains_valid_url() {
        let components = popularMoviesFetcher.fetchRequestComponents(page: 2)

        XCTAssertEqual(components.urlParams["page"], "2")

        let urlRequest = try? components.makeURLRequest()
        XCTAssertNotNil(urlRequest)

        let url = urlRequest?.url?.absoluteString
        XCTAssertTrue(url?.contains("/movie/popular") ?? false)
        XCTAssertTrue(url?.contains("page=2") ?? false)
    }

    func test_fetch_popular_movies_contains_authorization_token() {
        let components = popularMoviesFetcher.fetchRequestComponents(page: 1)

        XCTAssertTrue(components.addAuthorizationToken)
    }
}
