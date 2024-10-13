//
//  APIManagerTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import XCTest

@testable import NetworkService

@available(iOS 15.0, *)
final class APIManagerTests: XCTestCase {

    func test_init_request_should_throw_an_error() async throws {
        let url = URL(string: "https://mock.com")
        MockURLProtocol.testURLs = [url: Data()]

        // and create the URLSession from that
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)

        let apiManager = APIManager(urlSession: session)
        let mockRequest = MockNetworkRequest.make()
        do {
            _ = try await apiManager.initRequest(with: mockRequest)
            XCTFail("Expected error to be thrown, but no error was thrown")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
