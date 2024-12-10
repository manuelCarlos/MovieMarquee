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

    private let mockComponents = MockRequestComponents.make()
    private let mockURLsession: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }()

    func test_request_data_should_throw_a_401_http_response_error() async throws {
        let apiManager = APIManager(urlSession: mockURLsession)

        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://api.themoviedb.org/3/test?")
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 401,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, Data())
        }
        do {
            _ = try await apiManager.requestData(with: mockComponents)
            XCTFail("Expected error to be thrown, but no error was thrown")
        } catch {
            XCTAssertEqual(error as? NetworkError, .httpResponse(code: 401))
        }
    }

    func test_request_data_should_succeed() async throws {
        let json = """
        "id": 1
        "title": "This is a title"
        """
        let mockData = Data(json.utf8)

        let apiManager = APIManager(urlSession: mockURLsession)

        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString, "https://api.themoviedb.org/3/test?")
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 201,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, mockData)
        }

        let result = try await apiManager.requestData(with: mockComponents)
        XCTAssertEqual(result, mockData)
    }
}
