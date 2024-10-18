//
//  MediaFetchErrorTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 16.10.24.
//

import XCTest

@testable import PopularMoviesFeature

class MediaFetchErrorTests: XCTestCase {

    func test_error_description_for_no_popular_movies_available() {
        let error: MediaFetchError = .noPopularMoviesAvailable

        XCTAssertEqual(error.errorDescription, "There are no popular movies available.")
    }

    func test_error_description_for_invalid_data() {
        let error: MediaFetchError = .invalidData

        XCTAssertEqual(error.errorDescription, "The data received was invalid.")
    }

    func test_failure_reason_for_no_popular_movies_available() {
        let error: MediaFetchError = .noPopularMoviesAvailable

        XCTAssertEqual(error.failureReason, "The server returned an empty list of popular movies.")
    }

    func test_failure_reason_for_invalid_data() {
        let error: MediaFetchError = .invalidData

        XCTAssertEqual(error.failureReason, "The data could not be decoded as expected.")
    }

    func test_recovery_suggestion_for_no_popular_movies_available() {
        let error: MediaFetchError = .noPopularMoviesAvailable

        XCTAssertEqual(error.recoverySuggestion, "Try refreshing the page or check back later.")
    }

    func test_recovery_suggestion_for_invalid_data() {
        let error: MediaFetchError = .invalidData

        XCTAssertEqual(error.recoverySuggestion, "Please try again later or contact support.")
    }

    func test_help_anchor_for_no_popular_movies_available() {
        let error: MediaFetchError = .noPopularMoviesAvailable

        XCTAssertEqual(error.helpAnchor, "Make sure you're connected to the internet and the service is available.")
    }

    func test_help_anchor_for_invalid_data() {
        let error: MediaFetchError = .invalidData

        XCTAssertEqual(error.helpAnchor, "Check if the app is up to date or reach out to support for assistance.")
    }
}
