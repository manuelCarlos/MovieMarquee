//
//  APIManagerTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import Foundation
import XCTest

@testable import NetworkService

@available(iOS 15.0, *)
final class APIManagerTests: XCTestCase {

    func test_init_request_should_throw_a_401_http_response_error() async throws {
        let url = URL(string: "https://mock.com")
        MockURLProtocol.testURLs = [url: Data()]

        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)

        let apiManager = APIManager(urlSession: session)
        let mockComponents = MockRequestComponents.make()
        do {
            _ = try await apiManager.requestData(with: mockComponents)
            XCTFail("Expected error to be thrown, but no error was thrown")
        } catch {
            XCTAssertEqual(error as? NetworkError, .httpResponse(code: 401))
        }
    }
}
