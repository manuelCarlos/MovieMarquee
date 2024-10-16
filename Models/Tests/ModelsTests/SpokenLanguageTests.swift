//
//  SpokenLanguageTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import Models

final class SpokenLanguageTests: XCTestCase {

    func test_decoding_valid_json() throws {
        let json = """
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
        """
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let spokenLanguage = try decoder.decode(SpokenLanguage.self, from: jsonData)

        XCTAssertEqual(spokenLanguage.englishName, "English")
        XCTAssertEqual(spokenLanguage.iso6391, "en")
        XCTAssertEqual(spokenLanguage.name, "English")
    }

    func test_decoding_missing_iso6391() throws {
        let json = """
        {
            "english_name": "Spanish",
            "name": "Español"
        }
        """
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let spokenLanguage = try decoder.decode(SpokenLanguage.self, from: jsonData)

        XCTAssertEqual(spokenLanguage.englishName, "Spanish")
        XCTAssertNil(spokenLanguage.iso6391)
        XCTAssertEqual(spokenLanguage.name, "Español")
    }

    func test_decoding_invalid_json() {
        let json = """
        {
            "english_name": "French",
            "name": "Français"
        }
        """
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(SpokenLanguage.self, from: jsonData)) { error in
            XCTAssertNotNil(error as? DecodingError)
        }
    }
}
