//
//  FetchErrorTests.swift
//  NetworkService
//
//  Created by Manuel Lopes on 04.10.24.
//

import XCTest
@testable import NetworkService

final class FetchErrorTests: XCTestCase {

    func test_network_error_description() {
        let error = FetchError.networkError

        let description = error.errorDescription

        XCTAssertEqual(description, "Cannot Fetch Popular Movies", "The error description for networkError should be 'Cannot Fetch Popular Movies'.")
    }

    func test_network_error_recovery_suggestion() {
        let error = FetchError.networkError

        let suggestion = error.recoverySuggestion

        XCTAssertEqual(suggestion, "Due to a network or server issue, we couldn't fetch the data. Please try again later.", "The recovery suggestion for networkError should describe the issue and suggest trying again later.")
    }
}
