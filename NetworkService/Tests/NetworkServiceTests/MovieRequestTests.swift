//
//  MovieRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

@testable import TMDBData
@testable import NetworkService

final class MovieRequestTests: XCTestCase {

    func test_movie_request_get_popular_movies_path_should_be_correct() {
        let request = MovieRequest.getPopularMovies(page: 1)

        XCTAssertEqual(request.path, "/movie/popular")
        XCTAssertEqual(request.mediaType, .movie)
    }

    func test_movie_request_get_movie_detail_path_should_be_correct() {
        let request = MovieRequest.getMovieDetail(id: 123)

        XCTAssertEqual(request.path, "/movie/123")
        XCTAssertEqual(request.mediaType, .movie)
    }

    func test_movie_request_get_credits_path_should_be_correct() {
        let request = MovieRequest.getCredits(id: 123)

        XCTAssertEqual(request.path, "/movie/123/credits")
        XCTAssertEqual(request.mediaType, .movie)
    }

    func test_movie_request_get_popular_movies_url_params_should_include_page_and_api_key() {
        let page = 1
        let request = MovieRequest.getPopularMovies(page: page)

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["page"], "1")
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], "en-US")
        XCTAssertEqual(request.mediaType, .movie)
    }

    func test_movie_request_get_movie_detail_url_params_should_include_movie_id_and_api_key() {
        let movieId = 123
        let request = MovieRequest.getMovieDetail(id: movieId)

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["movie_id"], "123")
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["append_to_response"], "credits")
    }

    func test_movie_request_request_type_should_be_get() {
        let requests: [MovieRequest] = [
            .getPopularMovies(page: 1),
            .getMovieDetail(id: 123),
            .getCredits(id: 123)
        ]

        for request in requests {
            XCTAssertEqual(request.requestType, .GET)
        }
    }
}
