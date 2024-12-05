//
//  MovieTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import Models

@available(iOS 15, *)
final class MovieTests: XCTestCase {

    override func setUp() {
        super.setUp()

        dateOfReleaseFormatter.timeZone = .current
    }

    func test_default_initializer_returns_valid_instance() {
        let movie = Movie(
            id: 1,
            title: "Test Movie",
            adult: false,
            posterPath: "/path/to/poster",
            backdropPath: "/path/to/backdrop",
            overview: "This is a test overview",
            releaseDate: "2000-01-01",
            genreIds: [1, 2, 3],
            originalTitle: "Test Original Title",
            originalLanguage: .en,
            popularity: 8.7,
            voteCount: 100,
            video: false,
            voteAverage: 7.5
        )

        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Test Movie")
        XCTAssertEqual(movie.adult, false)
        XCTAssertEqual(movie.posterPath, "/path/to/poster")
        XCTAssertEqual(movie.backdropPath, "/path/to/backdrop")
        XCTAssertEqual(movie.overview, "This is a test overview")
        XCTAssertEqual(movie.genreIds, [1, 2, 3])
        XCTAssertEqual(movie.originalTitle, "Test Original Title")
        XCTAssertEqual(movie.originalLanguage, .en)
    }

    func test_movie_decoding_succefully() throws {
        let movie = try loadJson(from: "movie", as: Movie.self)

        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Test Movie")
        XCTAssertEqual(movie.adult, false)
        XCTAssertEqual(movie.posterPath, "/path/to/poster")
        XCTAssertEqual(movie.backdropPath, "/path/to/backdrop")
        XCTAssertEqual(movie.overview, "This is a test overview")
        XCTAssertEqual(movie.dateOfRelease, dateOfReleaseFormatter.date(from: "1970-01-01"))
        XCTAssertEqual(movie.genreIds, [1, 2, 3])
        XCTAssertEqual(movie.originalTitle, "Test Original Title")
        XCTAssertEqual(movie.originalLanguage, .en)
        XCTAssertEqual(movie.popularity, 8.7)
        XCTAssertEqual(movie.voteCount, 100)
        XCTAssertEqual(movie.video, false)
        XCTAssertEqual(movie.voteAverage, 7.5)
    }

    func test_movie_decoding_failure_due_to_malformed_json() throws {
        XCTAssertThrowsError(try loadJson(from: "malformed_movie", as: Movie.self)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func test_movie_encoding_succefully() throws {
        let movie = Movie(
            id: 1,
            title: "Test Movie",
            adult: false,
            posterPath: "/path/to/poster",
            backdropPath: "/path/to/backdrop",
            overview: "This is a test overview",
            releaseDate: "2000-01-01",
            genreIds: [1, 2, 3],
            originalTitle: "Test Original Title",
            originalLanguage: .en,
            popularity: 8.7,
            voteCount: 100,
            video: false,
            voteAverage: 7.5
        )

        // Set the date encoding strategy to use yyyy-MM-dd and force it to use UTC
        dateOfReleaseFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateOfReleaseFormatter)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateOfReleaseFormatter)

        let jsonData = try encoder.encode(movie)
        let decodedMovie = try decoder.decode(Movie.self, from: jsonData)

        XCTAssertEqual(decodedMovie.id, 1)
        XCTAssertEqual(decodedMovie.title, "Test Movie")
        XCTAssertEqual(decodedMovie.adult, false)
        XCTAssertEqual(decodedMovie.posterPath, "/path/to/poster")
        XCTAssertEqual(decodedMovie.backdropPath, "/path/to/backdrop")
        XCTAssertEqual(decodedMovie.overview, "This is a test overview")
        XCTAssertEqual(dateOfReleaseFormatter.string(from: decodedMovie.dateOfRelease ?? .distantFuture),
                       dateOfReleaseFormatter.string(from: movie.dateOfRelease ?? .distantPast))
        XCTAssertEqual(decodedMovie.genreIds, [1, 2, 3])
        XCTAssertEqual(decodedMovie.originalTitle, "Test Original Title")
        XCTAssertEqual(decodedMovie.originalLanguage, .en)
        XCTAssertEqual(decodedMovie.popularity, 8.7)
        XCTAssertEqual(decodedMovie.voteCount, 100)
        XCTAssertEqual(decodedMovie.video, false)
        XCTAssertEqual(decodedMovie.voteAverage, 7.5)
    }
}
