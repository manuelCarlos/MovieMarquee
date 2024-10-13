//
//  MovieRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

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

    func test_movie_request_get_movie_reviews_path_should_be_correct() {
        let request = MovieRequest.getMovieReviews(id: 123, page: 1)

        XCTAssertEqual(request.path, "/movie/123/reviews")
        XCTAssertEqual(request.mediaType, .movie)
    }

    func test_movie_request_get_similar_movies_to_path_should_be_correct() {
        let request = MovieRequest.getSimilarMoviesTo(id: 123, page: 1)

        XCTAssertEqual(request.path, "/movie/123/similar")
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

    func test_movie_request_get_movie_reviews_url_params_should_include_movie_id_page_and_api_key() {
        let movieId = 123
        let page = 1
        let request = MovieRequest.getMovieReviews(id: movieId, page: page)

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["movie_id"], "123")
        XCTAssertEqual(urlParams["page"], "1")
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], "en-US")
    }

    func test_movie_request_get_similar_movies_to_url_params_should_include_movie_id_page_and_api_key() {
        let movieId = 123
        let page = 1
        let request = MovieRequest.getSimilarMoviesTo(id: movieId, page: page)

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["movie_id"], "123")
        XCTAssertEqual(urlParams["page"], "1")
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], "en-US")
    }

    func test_movie_request_get_credits_url_params_should_include_movie_id_page_and_api_key() {
        let movieId = 123
        let page = 1
        let request = MovieRequest.getSimilarMoviesTo(id: movieId, page: page)

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["movie_id"], "123")
        XCTAssertEqual(urlParams["page"], "1")
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], "en-US")
    }

    func test_movie_request_request_type_should_be_get() {
        let requests: [MovieRequest] = [
            .getPopularMovies(page: 1),
            .getMovieDetail(id: 123),
            .getMovieReviews(id: 123, page: 1),
            .getSimilarMoviesTo(id: 123, page: 1),
            .getCredits(id: 123)
        ]

        for request in requests {
            XCTAssertEqual(request.requestType, .GET)
        }
    }
}
