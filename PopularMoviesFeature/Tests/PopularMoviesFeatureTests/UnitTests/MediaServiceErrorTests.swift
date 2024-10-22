//
//  MediaServiceErrorTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 16.10.24.
//

import XCTest

@testable import PopularMoviesFeature

final class MediaServiceErrorTests: XCTestCase {

    func test_error_description_for_no_popular_movies_available() {
        let error: MediaServiceError = .noPopularMoviesAvailable

        XCTAssertEqual(error.errorDescription, "There are no popular movies available.")
    }

    func test_failure_reason_for_no_popular_movies_available() {
        let error: MediaServiceError = .noPopularMoviesAvailable

        XCTAssertEqual(error.failureReason, "The server returned an empty list of popular movies.")
    }

    func test_recovery_suggestion_for_no_popular_movies_available() {
        let error: MediaServiceError = .noPopularMoviesAvailable

        XCTAssertEqual(error.recoverySuggestion, "Try refreshing the page or check back later.")
    }

    func test_help_anchor_for_no_popular_movies_available() {
        let error: MediaServiceError = .noPopularMoviesAvailable

        XCTAssertEqual(error.helpAnchor, "Make sure you're connected to the internet and the service is available.")
    }
}
