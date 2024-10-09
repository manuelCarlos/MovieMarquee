//
//  CastTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import Models

final class CastTests: XCTestCase {

    func test_decoding_succefully() throws {
        guard let path = Bundle.module.url(forResource: "cast", withExtension: "json") else {
            XCTFail("Missing file: cast.json")
            return
        }

        let jsonData = try Data(contentsOf: path)
        let decoder = JSONDecoder()
        let cast = try decoder.decode(Cast.self, from: jsonData)

        XCTAssertEqual(cast.adult, true)
        XCTAssertEqual(cast.gender, 1)
        XCTAssertEqual(cast.id, 100)
        XCTAssertEqual(cast.knownForDepartment, .acting)
        XCTAssertEqual(cast.name, "John Doe")
        XCTAssertEqual(cast.originalName, "Original John")
        XCTAssertEqual(cast.popularity, 8.5)
        XCTAssertEqual(cast.profilePath, "/path/to/profile")
        XCTAssertEqual(cast.castID, 10)
        XCTAssertEqual(cast.character, "Main Character")
        XCTAssertEqual(cast.creditID, "credit_123")
        XCTAssertEqual(cast.order, 1)
        XCTAssertEqual(cast.department, .acting)
        XCTAssertEqual(cast.job, "Actor")
        XCTAssertEqual(cast.backdropPath, "/path/to/backdrop")
        XCTAssertEqual(cast.genreIDS, [1, 2, 3])
        XCTAssertEqual(cast.originalLanguage, .en)
        XCTAssertEqual(cast.originalTitle, "Original Title")
        XCTAssertEqual(cast.overview, "This is an overview")
        XCTAssertEqual(cast.posterPath, "/path/to/poster")
        XCTAssertNotNil(cast.releaseDate)
        XCTAssertEqual(cast.title, "Movie Title")
        XCTAssertEqual(cast.video, false)
        XCTAssertEqual(cast.voteAverage, 7.5)
        XCTAssertEqual(cast.voteCount, 100)
    }

    func test_decoding_malformed_json_should_fail() throws {
        guard let path = Bundle.module.url(forResource: "malformed_cast", withExtension: "json") else {
            XCTFail("Missing file: malformed_cast.json")
            return
        }

        let jsonData = try Data(contentsOf: path)
        let decoder = JSONDecoder()

        XCTAssertThrowsError(try decoder.decode(Cast.self, from: jsonData)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func test_get_title() {
        let cast1 = Cast.makeCast(title: nil)

        XCTAssertEqual(cast1.getTitle, "Original Title")

        let cast2 = Cast.makeCast(originalTitle: nil, title: nil)

        XCTAssertEqual(cast2.getTitle, "Original Name")

        let cast3 = Cast.makeCast(originalName: nil, originalTitle: nil, title: nil)

        XCTAssertEqual(cast3.getTitle, "")
    }

    func test_get_image_path() {
        let cast1 = Cast.makeCast(posterPath: nil)

        XCTAssertEqual(cast1.getImagePath, "ProfilePath")

        let cast2 = Cast.makeCast(profilePath: nil, posterPath: nil)

        XCTAssertEqual(cast2.getImagePath, "")
    }

    func test_get_role() {
        let cast1 = Cast.makeCast(character: nil, job: nil)

        XCTAssertEqual(cast1.getRole, "Acting")

        let cast2 = Cast.makeCast(character: nil, job: "Director")

        XCTAssertEqual(cast2.getRole, "Director")

        let cast3 = Cast.makeCast(character: "Main Character", job: "Director")

        XCTAssertEqual(cast3.getRole, "Main Character")
    }

    func test_get_known_for_department() {
        let cast1 = Cast.makeCast(knownForDepartment: .actor, job: "Godot")

        XCTAssertEqual(cast1.getKnownForDepartment, "Actors")

        let cast2 = Cast.makeCast(character: nil, job: "Director")

        XCTAssertEqual(cast2.getKnownForDepartment, "Acting")

        let cast3 = Cast.makeCast(knownForDepartment: .art, job: "Extra")

        XCTAssertEqual(cast3.getKnownForDepartment, "Art")
    }
}
