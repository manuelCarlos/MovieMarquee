//
//  MovieDetailsTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 12.10.24.
//

import XCTest

@testable import Models

@available(iOS 16.0, *)
final class MovieDetailsTests: XCTestCase {

    func test_default_initializer_returns_valid_instance() {
        let movieDetails = MovieDetails(id: 12,
                                        adult: false,
                                        releaseDate: nil,
                                        genres: [],
                                        budget: 1000,
                                        popularity: 4.4,
                                        revenue: 2000,
                                        status: "ok",
                                        title: "The cookie monster",
                                        video: false)

        XCTAssertEqual(movieDetails.adult, false)
        XCTAssertEqual(movieDetails.id, 12)
        XCTAssertEqual(movieDetails.title, "The cookie monster")
        XCTAssertEqual(movieDetails.voteAverage, nil)
        XCTAssertNil(movieDetails.dateOfRelease)
        XCTAssertEqual(movieDetails.originalLanguage?.rawValue, nil)
        XCTAssertEqual(movieDetails.originalTitle, nil)
        XCTAssertEqual(movieDetails.popularity, 4.4)
        XCTAssertNil(movieDetails.productionCompanies)
        XCTAssertNil(movieDetails.productionCountries)
        XCTAssertEqual(movieDetails.revenue, 2000)
        XCTAssertEqual(movieDetails.runtime, nil)
        XCTAssertNil(movieDetails.spokenLanguages)
        XCTAssertEqual(movieDetails.status, "ok")
        XCTAssertEqual(movieDetails.tagline, nil)
        XCTAssertEqual(movieDetails.video, false)
        XCTAssertEqual(movieDetails.voteCount, nil)
        XCTAssertEqual(movieDetails.belongsToCollection, nil)
        XCTAssertEqual(movieDetails.homepage, nil)
        XCTAssertEqual(movieDetails.imdbId, nil)
        XCTAssertEqual(movieDetails.posterPath, nil)
        XCTAssertEqual(movieDetails.backdropPath, nil)
        XCTAssertEqual(movieDetails.overview, nil)
        XCTAssertEqual(movieDetails.genres, [])
        XCTAssertEqual(movieDetails.budget, 1000)
        XCTAssertEqual(movieDetails.credits, nil)
        XCTAssertNil(movieDetails.credits)
    }

    func test_movie_details_decoding_valid_data() throws {
        let movieDetails = try loadJson(from: "movieDetail", as: MovieDetails.self)

        XCTAssertEqual(movieDetails.adult, false)
        XCTAssertEqual(movieDetails.id, 123)
        XCTAssertEqual(movieDetails.title, "Movie Title")
        XCTAssertEqual(movieDetails.voteAverage, 8.0)
        XCTAssertEqual(movieDetails.dateOfRelease, dateOfReleaseFormatter.date(from: "2023-10-09"))
        XCTAssertEqual(movieDetails.originalLanguage?.rawValue, "en")
        XCTAssertEqual(movieDetails.localizedRuntime, "2 hr, 36 min")
    }

    func test_movie_details_decoding_missing_optional_fields() throws {
        let movieDetails = try loadJson(from: "movieDetail_without_optional_attributes", as: MovieDetails.self)

        XCTAssertEqual(movieDetails.id, 456)
        XCTAssertEqual(movieDetails.adult, true)
        XCTAssertNil(movieDetails.posterPath)
        XCTAssertEqual(movieDetails.title, "Another Movie")
        XCTAssertEqual(movieDetails.dateOfRelease, dateOfReleaseFormatter.date(from: "2024-10-09"))
        XCTAssertNil(movieDetails.localizedRuntime)
    }

    func test_movie_details_decoding_invalid_release_date_format() throws {
        let movieDetails = try loadJson(from: "movieDetail_with_invalid_release_date_attribute", as: MovieDetails.self)

        XCTAssertEqual(movieDetails.id, 789)
        XCTAssertNil(movieDetails.dateOfRelease)
    }

    func test_movie_details_decoding_missing_required_field() throws {
        XCTAssertThrowsError(try loadJson(from: "movieDetail_missing_required_attribute", as: MovieDetails.self)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
