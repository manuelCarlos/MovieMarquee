//
//  AuthNetworkRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

@testable import NetworkService

final class AuthNetworkRequestTests: XCTestCase {

    func test_auth_network_request_host_should_be_auth_url() {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)
        let host = request.host

        XCTAssertEqual(host, APIConstants.authURL)
    }

    func test_auth_network_request_host_path_should_be_auth_url_path() {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)

        let hostPath = request.hostPath

        XCTAssertEqual(hostPath, APIConstants.authURLPath)
    }

    func test_auth_network_request_should_build_correct_url() throws {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)

        let urlRequest = try request.makeRequest()
        let urlString = urlRequest.url?.absoluteString

        XCTAssertEqual(urlString, "\(APIConstants.httpsScheme)://\(APIConstants.authURL)\(APIConstants.authURLPath)/login?")
    }

    func test_auth_network_request_should_have_correct_http_method() throws {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)

        let urlRequest = try request.makeRequest()

        XCTAssertEqual(urlRequest.httpMethod, "POST")
    }

    func test_auth_network_request_should_have_json_content_type() throws {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)

        let urlRequest = try request.makeRequest()

        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), "application/json")
    }

    func test_auth_network_request_should_not_have_body_when_params_empty() throws {
        let request = MockAuthNetworkRequest(path: "/login", requestType: .POST)

        let urlRequest = try request.makeRequest()

        XCTAssertNil(urlRequest.httpBody)
    }

    func test_auth_network_request_should_have_body_when_params_provided() throws {
        struct ParamRequest: AuthNetworkRequest {
            var path: String
            var requestType: RequestType
            var params: [String: Any]
        }
        
        let params = ["username": "testuser", "password": "password123"]
        let request = ParamRequest(path: "/login", requestType: .POST, params: params)

        let urlRequest = try request.makeRequest()
        let body = urlRequest.httpBody
        let jsonBody = try JSONSerialization.jsonObject(with: body!, options: []) as? [String: Any]

        XCTAssertEqual(jsonBody?["username"] as? String, "testuser")
        XCTAssertEqual(jsonBody?["password"] as? String, "password123")
    }
}
