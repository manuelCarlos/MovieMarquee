//
//  DataParserTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 12.10.24.
//

import XCTest

@testable import NetworkService

final class DataParserTests: XCTestCase {

    var dataParser: DataParser!

    override func setUp() {
        super.setUp()
        dataParser = DataParser()
    }

    override func tearDown() {
        dataParser = nil
        super.tearDown()
    }

    func test_parse_movies_response_success() throws {
        let jsonString = """
        {
          "page": 1,
          "results": [
            {
              "adult": false,
              "backdrop_path": "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
              "genre_ids": [28, 35, 878],
              "id": 533535,
              "original_language": "en",
              "original_title": "Deadpool & Wolverine",
              "overview": "A listless Wade Wilson toils away in civilian life...",
              "popularity": 3614.704,
              "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
              "release_date": "2024-07-24",
              "title": "Deadpool & Wolverine",
              "video": false,
              "vote_average": 7.7,
              "vote_count": 4296
            }
          ],
          "total_pages": 46481,
          "total_results": 929608
        }
        """

        let jsonData = jsonString.data(using: .utf8)!
        let moviesResponse: MockMovies = try dataParser.parse(data: jsonData)

        XCTAssertEqual(moviesResponse.page, 1)
        XCTAssertEqual(moviesResponse.totalPages, 46481)
        XCTAssertEqual(moviesResponse.totalResults, 929608)
        XCTAssertEqual(moviesResponse.results?.count, 1)

        let firstMovie = moviesResponse.results?.first
        XCTAssertNotNil(firstMovie)
        XCTAssertEqual(firstMovie?.id, 533535)
        XCTAssertEqual(firstMovie?.title, "Deadpool & Wolverine")
        XCTAssertEqual(firstMovie?.releaseDate, "2024-07-24")
        XCTAssertEqual(firstMovie?.voteAverage, 7.7)
    }

    func test_parse_invalid_json() {
        let invalidJsonString = """
        {
          "page": "invalid",
          "results": [
            {
              "id": 533535,
              "title": "Deadpool & Wolverine"
            }
          ]
        }
        """

        let jsonData = invalidJsonString.data(using: .utf8)!
        XCTAssertThrowsError(try dataParser.parse(data: jsonData) as MockMovies) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func test_parse_empty_data() {
        let emptyData = Data()
        XCTAssertThrowsError(try dataParser.parse(data: emptyData) as MockMovies) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func test_parse_empty_results_array() throws {
        let jsonStringEmptyResults = """
        {
          "page": 1,
          "results": [],
          "total_pages": 46481,
          "total_results": 929608
        }
        """

        let jsonData = jsonStringEmptyResults.data(using: .utf8)!
        let moviesResponse: MockMovies = try dataParser.parse(data: jsonData)

        XCTAssertEqual(moviesResponse.results?.count, 0)
        XCTAssertEqual(moviesResponse.totalResults, 929608)
    }

    func test_parse_incorrect_data_type_for_field() {
        let jsonStringIncorrectDataType = """
        {
          "page": 1,
          "results": [
            {
              "adult": "false", // Should be a Boolean
              "backdrop_path": "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
              "genre_ids": [28, 35, 878],
              "id": 533535,
              "original_language": "en",
              "original_title": "Deadpool & Wolverine",
              "overview": "A listless Wade Wilson toils away in civilian life...",
              "popularity": 3614.704,
              "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
              "release_date": "2024-07-24",
              "title": "Deadpool & Wolverine",
              "video": false,
              "vote_average": 7.7,
              "vote_count": 4296
            }
          ],
          "total_pages": 46481,
          "total_results": 929608
        }
        """

        let jsonData = jsonStringIncorrectDataType.data(using: .utf8)!
        XCTAssertThrowsError(try dataParser.parse(data: jsonData) as MockMovies) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
