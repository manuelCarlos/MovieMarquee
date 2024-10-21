//
//  CastTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import Models

final class CastTests: XCTestCase {

    func test_decoding_successfully() throws {
        let cast = try loadJson(from: "cast", as: Cast.self)

        XCTAssertEqual(cast.adult, true)
        XCTAssertEqual(cast.gender, 1)
        XCTAssertEqual(cast.id, 100)
        XCTAssertEqual(cast.knownForDepartment, .acting)
        XCTAssertEqual(cast.name, "John Doe")
        XCTAssertEqual(cast.originalName, "Original John")
        XCTAssertEqual(cast.popularity, 8.5)
        XCTAssertEqual(cast.profilePath, "/path/to/profile")
        XCTAssertEqual(cast.castId, 10)
        XCTAssertEqual(cast.character, "Main Character")
        XCTAssertEqual(cast.creditId, "credit_123")
        XCTAssertEqual(cast.order, 1)
        XCTAssertEqual(cast.department, .acting)
        XCTAssertEqual(cast.job, "Actor")
        XCTAssertEqual(cast.backdropPath, "/path/to/backdrop")
        XCTAssertEqual(cast.genreIds, [1, 2, 3])
        XCTAssertEqual(cast.originalLanguage, .en)
        XCTAssertEqual(cast.originalTitle, "Original Title")
        XCTAssertEqual(cast.overview, "This is an overview")
        XCTAssertEqual(cast.posterPath, "/path/to/poster")
        XCTAssertEqual(cast.releaseDate, DateFormatter.yyyyMMdd.date(from: "1974-10-06"))
        XCTAssertEqual(cast.title, "Movie Title")
        XCTAssertEqual(cast.video, false)
        XCTAssertEqual(cast.voteAverage, 7.5)
        XCTAssertEqual(cast.voteCount, 100)
    }

    func test_decoding_malformed_json_should_fail() throws {
        XCTAssertThrowsError(try loadJson(from: "malformed_cast", as: Cast.self)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func test_cast_encoding_successfully() throws {
        // Set the date encoding strategy to use yyyy-MM-dd and force it to use UTC
        let dateFormatter = DateFormatter.yyyyMMdd
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        let cast = Cast.makeCast()
        let jsonData = try encoder.encode(cast)
        let decodedMovie = try decoder.decode(Cast.self, from: jsonData)

        XCTAssertEqual(decodedMovie.id, 1)
        XCTAssertEqual(decodedMovie.title, "Title")
        XCTAssertEqual(decodedMovie.adult, true)
        XCTAssertEqual(decodedMovie.posterPath, "PostPath")
        XCTAssertEqual(decodedMovie.backdropPath, "BackdropPath")
        XCTAssertEqual(decodedMovie.overview, "Overview")
        XCTAssertEqual(dateFormatter.string(from: decodedMovie.releaseDate ?? .distantFuture),
                       dateFormatter.string(from: cast.releaseDate ?? .distantPast))
        XCTAssertEqual(decodedMovie.genreIds, [1, 2, 3])
        XCTAssertEqual(decodedMovie.originalTitle, "Original Title")
        XCTAssertEqual(decodedMovie.originalLanguage, .en)
        XCTAssertEqual(decodedMovie.popularity, 10.0)
        XCTAssertEqual(decodedMovie.voteCount, 1000)
        XCTAssertEqual(decodedMovie.video, false)
        XCTAssertEqual(decodedMovie.voteAverage, 7.2)
    }

    func test_title() {
        let cast1 = Cast.makeCast()
        XCTAssertEqual(cast1.titleString, "Name")

        let cast2 = Cast.makeCast(name: nil, originalTitle: nil, title: nil)
        XCTAssertEqual(cast2.titleString, "Original Name")

        let cast3 = Cast.makeCast(name: nil, originalName: nil, title: nil)
        XCTAssertEqual(cast3.titleString, "Original Title")

        let cast4 = Cast.makeCast(name: nil, originalName: nil, originalTitle: nil)
        XCTAssertEqual(cast4.titleString, "Title")

        let cast5 = Cast.makeCast(name: nil, originalName: nil, originalTitle: nil, title: nil)
        XCTAssertNil(cast5.titleString)
    }

    func test_image_path() {
        let cast1 = Cast.makeCast(posterPath: nil)
        XCTAssertEqual(cast1.imagePath, "ProfilePath")

        let cast2 = Cast.makeCast(profilePath: nil, posterPath: nil)
        XCTAssertNil(cast2.imagePath)
    }

    func test_role() {
        let cast1 = Cast.makeCast(character: nil, job: nil)
        XCTAssertEqual(cast1.role, "Acting")

        let cast2 = Cast.makeCast(character: nil, job: "Director")
        XCTAssertEqual(cast2.role, "Director")

        let cast3 = Cast.makeCast(character: "Main Character", job: "Director")
        XCTAssertEqual(cast3.role, "Main Character")
    }
}
