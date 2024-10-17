//
//  MoviesDBErrorTests.swift
//  MoviesDBTests
//
//  Created by Manuel Lopes on 16.10.24.
//

import XCTest

@testable import MoviesDB

class MoviesDBErrorTests: XCTestCase {

    func test_error_description_for_not_found() {
        let error: MoviesDBError = .notFound
        XCTAssertEqual(error.errorDescription, "The requested movie could not be found.")
    }

    func test_failure_reason_for_not_found() {
        let error: MoviesDBError = .notFound
        XCTAssertEqual(error.failureReason, "The movie might have been removed or is unavailable in the database.")
    }

    func test_recovery_suggestion_for_not_found() {
        let error: MoviesDBError = .notFound
        XCTAssertEqual(error.recoverySuggestion, "Try searching for another movie or check your internet connection.")
    }

    func test_help_anchor_for_not_found() {
        let error: MoviesDBError = .notFound
        XCTAssertEqual(error.helpAnchor, "For further assistance, contact support or visit the help center.")
    }
}
