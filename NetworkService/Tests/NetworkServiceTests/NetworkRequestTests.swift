//
//  NetworkRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 07.10.24.
//

import XCTest

@testable import NetworkService

final class NetworkRequestTests: XCTestCase {

    func test_valid_url_creation() throws {
        let networkRequest = MockNetworkRequest.make()

        let urlRequest = try networkRequest.makeRequest()

        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "api.themoviedb.org")
        XCTAssertEqual(urlRequest.url?.path, "/3/test")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(networkRequest.urlParams, [:])
    }

    func test_request_type_post() throws {
        let networkRequest = MockNetworkRequest.make(requestType: .POST)

        let urlRequest = try networkRequest.makeRequest()

        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "api.themoviedb.org")
        XCTAssertEqual(urlRequest.url?.path, "/3/test")
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(networkRequest.urlParams, [:])
    }

    func test_headers_setup() throws {
        let headers = ["Authorization": "Bearer token"]
        let networkRequest = MockNetworkRequest.make(headers: headers)

        let urlRequest = try networkRequest.makeRequest()

        XCTAssertEqual(urlRequest.allHTTPHeaderFields?["Authorization"], "Bearer token")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields?["Content-Type"], "application/json")
        XCTAssertEqual(networkRequest.urlParams, [:])
    }

    func test_url_params_setup() throws {
        let urlParams = ["query": "value", "filter": "active"]
        let networkRequest = MockNetworkRequest.make(urlParams: urlParams)

        let urlRequest = try networkRequest.makeRequest()

        let queryItems = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)?.queryItems

        XCTAssertEqual(queryItems?.count, 2)
        XCTAssertEqual(queryItems?.first(where: { $0.name == "query" })?.value, "value")
        XCTAssertEqual(queryItems?.first(where: { $0.name == "filter" })?.value, "active")
        XCTAssertEqual(networkRequest.urlParams["query"], "value")
        XCTAssertEqual(networkRequest.urlParams["filter"], "active")
    }

    func test_json_body_encoding() throws {
        let params: [String: Any] = ["key1": "value1", "key2": 42]
        let networkRequest = MockNetworkRequest.make(params: params)

        let urlRequest = try networkRequest.makeRequest()

        let json = try JSONSerialization.jsonObject(with: urlRequest.httpBody!, options: []) as? [String: Any]

        XCTAssertEqual(json?["key1"] as? String, "value1")
        XCTAssertEqual(json?["key2"] as? Int, 42)
        XCTAssertEqual(networkRequest.urlParams, [:])
    }
}
