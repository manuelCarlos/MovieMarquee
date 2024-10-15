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

    func test_default_initializer_returns_valid_instance() {
        let movieDetail = MovieDetail(id: 12,
                                      adult: false,
                                      releaseDate: .distantPast,
                                      genres: [],
                                      budget: 1000,
                                      popularity: 4.4,
                                      revenue: 2000,
                                      status: "ok",
                                      title: "The cookie monster",
                                      video: false)

        XCTAssertEqual(movieDetail.adult, false)
        XCTAssertEqual(movieDetail.id, 12)
        XCTAssertEqual(movieDetail.title, "The cookie monster")
        XCTAssertEqual(movieDetail.voteAverage, nil)
        XCTAssertEqual(movieDetail.releaseDate, .distantPast)
        XCTAssertEqual(movieDetail.originalLanguage?.rawValue, nil)
        XCTAssertEqual(movieDetail.originalTitle, nil)
        XCTAssertEqual(movieDetail.popularity, 4.4)
        XCTAssertNil(movieDetail.productionCompanies)
        XCTAssertNil(movieDetail.productionCountries)
        XCTAssertEqual(movieDetail.revenue, 2000)
        XCTAssertEqual(movieDetail.runtime, nil)
        XCTAssertNil(movieDetail.spokenLanguages)
        XCTAssertEqual(movieDetail.status, "ok")
        XCTAssertEqual(movieDetail.tagline, nil)
        XCTAssertEqual(movieDetail.video, false)
        XCTAssertEqual(movieDetail.voteCount, nil)
        XCTAssertEqual(movieDetail.belongsToCollection, nil)
        XCTAssertEqual(movieDetail.homepage, nil)
        XCTAssertEqual(movieDetail.imdbId, nil)
        XCTAssertEqual(movieDetail.posterPath, nil)
        XCTAssertEqual(movieDetail.backdropPath, nil)
        XCTAssertEqual(movieDetail.overview, nil)
        XCTAssertEqual(movieDetail.genres, [])
        XCTAssertEqual(movieDetail.budget, 1000)
        XCTAssertEqual(movieDetail.credits, nil)
        XCTAssertNil(movieDetail.credits)
    }

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
