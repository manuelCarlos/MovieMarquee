//
//  ArtistRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

@testable import TMDBData
@testable import NetworkService

final class ArtistRequestTests: XCTestCase {

    func test_artist_request_get_popular_artists_path_should_be_correct() {
        let request = ArtistRequest.getPopularArtists(page: 1)
        let path = request.path
        XCTAssertEqual(path, "/person/popular")
    }

    func test_artist_request_get_artist_path_should_be_correct() {
        let request = ArtistRequest.getArtist(id: 123)
        let path = request.path
        XCTAssertEqual(path, "/person/123")
    }

    func test_artist_request_get_tv_credits_path_should_be_correct() {
        let request = ArtistRequest.getTVCredits(id: 123)
        let path = request.path
        XCTAssertEqual(path, "/person/123/tv_credits")
    }

    func test_artist_request_get_movie_credits_path_should_be_correct() {
        let request = ArtistRequest.getMovieCredits(id: 123)
        let path = request.path
        XCTAssertEqual(path, "/person/123/movie_credits")
    }

    func test_artist_request_get_images_path_should_be_correct() {
        let request = ArtistRequest.getImages(id: 123)
        let path = request.path
        XCTAssertEqual(path, "/person/123/images")
    }

    func test_artist_request_get_popular_artists_url_params_should_include_page_and_api_key() {
        let page = 1
        let request = ArtistRequest.getPopularArtists(page: page)
        let urlParams = request.urlParams
        XCTAssertEqual(urlParams["page"], String(page))
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], APIConstants.language)
    }

    func test_artist_request_get_artist_url_params_should_include_person_id_and_api_key() {
        let id = 123
        let request = ArtistRequest.getArtist(id: id)
        let urlParams = request.urlParams
        XCTAssertEqual(urlParams["person_id"], String(id))
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], APIConstants.language)
    }

    func test_artist_request_get_tv_credits_url_params_should_include_person_id_and_api_key() {
        let id = 123
        let request = ArtistRequest.getTVCredits(id: id)
        let urlParams = request.urlParams
        XCTAssertEqual(urlParams["person_id"], String(id))
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], APIConstants.language)
    }

    func test_artist_request_get_movie_credits_url_params_should_include_person_id_and_api_key() {
        let id = 123
        let request = ArtistRequest.getMovieCredits(id: id)
        let urlParams = request.urlParams
        XCTAssertEqual(urlParams["person_id"], String(id))
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
        XCTAssertEqual(urlParams["language"], APIConstants.language)
    }

    func test_artist_request_get_images_url_params_should_include_person_id_and_api_key() {
        let id = 123
        let request = ArtistRequest.getImages(id: id)
        let urlParams = request.urlParams
        XCTAssertEqual(urlParams["person_id"], String(id))
        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
    }

    func test_artist_request_request_type_should_be_get() {
        let requests: [ArtistRequest] = [
            .getPopularArtists(page: 1),
            .getArtist(id: 123),
            .getTVCredits(id: 123),
            .getMovieCredits(id: 123),
            .getImages(id: 123)
        ]

        for request in requests {
            XCTAssertEqual(request.requestType, .GET)
        }
    }
}
