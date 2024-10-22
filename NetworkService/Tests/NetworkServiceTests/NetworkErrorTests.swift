//
//  NetworkErrorTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import XCTest

@testable import NetworkService

final class NetworkErrorTests: XCTestCase {

    func test_invalid_url_error_description() {
        let error = NetworkError.invalidURL
        XCTAssertEqual(error.errorDescription, "Invalid URL error.")
    }

    func test_invalid_http_url_response_error_description() {
        let error = NetworkError.invalidHTTPURLResponse
        XCTAssertEqual(error.errorDescription, "Invalid HTTP URL response.")
    }

    func test_http_response_error_description() {
        let code = 404
        let error = NetworkError.httpResponse(code: code)
        XCTAssertEqual(error.errorDescription, "Received an HTTP error response.")
    }

    func test_invalid_url_failure_reason() {
        let error = NetworkError.invalidURL
        XCTAssertEqual(error.failureReason, "The URL provided was invalid.")
    }

    func test_invalid_http_url_response_failure_reason() {
        let error = NetworkError.invalidHTTPURLResponse
        XCTAssertEqual(error.failureReason, "The server response was not a valid HTTP response.")
    }

    func test_http_response_failure_reason() {
        let code = 500
        let error = NetworkError.httpResponse(code: code)
        XCTAssertEqual(error.failureReason, "The server returned an HTTP error response with status code 500.")
    }

    func test_invalid_url_recovery_suggestion() {
        let error = NetworkError.invalidURL
        XCTAssertEqual(error.recoverySuggestion, "Please check the URL and try again.")
    }

    func test_invalid_http_url_response_recovery_suggestion() {
        let error = NetworkError.invalidHTTPURLResponse
        XCTAssertEqual(error.recoverySuggestion, "Try refreshing the page or check the server.")
    }

    func test_http_response_recovery_suggestion() {
        let code = 503
        let error = NetworkError.httpResponse(code: code)
        XCTAssertEqual(error.recoverySuggestion, "Try again later, or contact support if the issue persists.")
    }

    func test_invalid_url_help_anchor() {
        let error = NetworkError.invalidURL
        XCTAssertEqual(error.helpAnchor, "Invalid URL")
    }

    func test_invalid_http_url_response_help_anchor() {
        let error = NetworkError.invalidHTTPURLResponse
        XCTAssertEqual(error.helpAnchor, "Invalid HTTP URL Response")
    }

    func test_http_response_help_anchor() {
        let code = 403
        let error = NetworkError.httpResponse(code: code)
        XCTAssertEqual(error.helpAnchor, "HTTP Response Error")
    }
}
