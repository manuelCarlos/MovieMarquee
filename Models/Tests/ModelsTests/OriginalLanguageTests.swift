//
//  OriginalLanguageTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import Models

final class OriginalLanguageTests: XCTestCase {

    func test_init_with_valid_language_name() {
        let language = OriginalLanguage(language: "English")
        XCTAssertEqual(language, .en)
    }

    func test_init_with_invalid_language_name() {
        let language = OriginalLanguage(language: "InvalidLanguage")
        XCTAssertNil(language)
    }

    func test_init_with_valid_iso_code() {
        let language = OriginalLanguage(isoCode: "en")
        XCTAssertEqual(language, .en)
    }

    func test_init_with_invalid_iso_code() {
        let language = OriginalLanguage(isoCode: "xxl")
        XCTAssertNil(language)
    }

    func test_language_property() {
        let language = OriginalLanguage.en
        XCTAssertEqual(language.language, "English")
    }

    func test_all_cases_count() {
        let allLanguages = OriginalLanguage.allCases
        XCTAssertEqual(allLanguages.count, 187)
    }
}
