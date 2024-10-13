//
//  MovieDetailTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 12.10.24.
//

import XCTest

@testable import Models

@available(iOS 16.0, *)
final class MovieDetailTests: XCTestCase {
    
    func test_movie_detail_decoding_valid_data() throws {
        let movieDetail = try loadJson(from: "movieDetail", as: MovieDetail.self)

        XCTAssertEqual(movieDetail.adult, false)
        XCTAssertEqual(movieDetail.id, 123)
        XCTAssertEqual(movieDetail.title, "Movie Title")
        XCTAssertEqual(movieDetail.voteAverage, 8.0)
        XCTAssertEqual(movieDetail.releaseDate, DateFormatter.yyyyMMdd.date(from: "2023-10-09"))
        XCTAssertEqual(movieDetail.originalLanguage?.rawValue, "en")
        XCTAssertEqual(movieDetail.localizedRuntime, "2 hr, 36 min")
    }

    func test_movie_detail_decoding_missing_optional_fields() throws {
        let movieDetail = try loadJson(from: "movieDetail_without_optional_attributes", as: MovieDetail.self)
        
        XCTAssertEqual(movieDetail.id, 456)
        XCTAssertEqual(movieDetail.adult, true)
        XCTAssertNil(movieDetail.posterPath)
        XCTAssertEqual(movieDetail.title, "Another Movie")
        XCTAssertEqual(movieDetail.releaseDate, DateFormatter.yyyyMMdd.date(from: "2024-10-09"))
        XCTAssertNil(movieDetail.localizedRuntime)
    }
    
    func test_movie_detail_decoding_invalid_release_date_format() throws {
        let movieDetail = try loadJson(from: "movieDetail_with_invalid_release_date_attribute", as: MovieDetail.self)

        XCTAssertEqual(movieDetail.id, 789)
        XCTAssertNil(movieDetail.releaseDate)
    }
    
    func test_movie_detail_decoding_missing_required_field() throws {
        XCTAssertThrowsError(try loadJson(from: "movieDetail_missing_required_attribute", as: MovieDetail.self)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
