//
//  OriginalLanguageTests.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import XCTest

@testable import Models

final class OriginalLanguageTests: XCTestCase {

    func test_init_with_invalid_iso_code() {
        let language: OriginalLanguage = "xxl"
        XCTAssertNil(language.localizedString)
    }

    func test_localized_string_property() {
        let language: OriginalLanguage = "af"
        XCTAssertEqual(language.localizedString, "Afrikaans")
    }
}
