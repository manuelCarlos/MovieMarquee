//
//  NetworkErrorTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import XCTest

@testable import NetworkService

final class NetworkErrorTests: XCTestCase {

    func test_invalid_server_response_error_description() {
        let error: NetworkError = .invalidServerResponse
        XCTAssertEqual(error.errorDescription, "The server returned an invalid response.")
    }

    func test_invalid_url_error_description() {
        let error: NetworkError = .invalidURL
        XCTAssertEqual(error.errorDescription, "URL string is malformed.")
    }
}
