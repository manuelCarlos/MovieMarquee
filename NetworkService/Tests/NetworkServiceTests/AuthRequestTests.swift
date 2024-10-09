//
//  AuthRequestTests.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

@testable import NetworkService

final class AuthRequestTests: XCTestCase {

    func test_auth_request_new_auth_token_path_should_be_correct() {
        let request = AuthRequest.newAuthToken

        let path = request.path

        XCTAssertEqual(path, "/authentication/token/new")
    }

    func test_auth_request_new_auth_session_id_path_should_be_correct() {
        let request = AuthRequest.newAuthSessionId(requestToken: "testToken")

        let path = request.path

        XCTAssertEqual(path, "/authentication/session/new")
    }

    func test_auth_request_new_auth_token_url_params_should_include_api_key() {
        let request = AuthRequest.newAuthToken

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
    }

    func test_auth_request_new_auth_session_id_url_params_should_include_api_key() {
        let request = AuthRequest.newAuthSessionId(requestToken: "testToken")

        let urlParams = request.urlParams

        XCTAssertEqual(urlParams["api_key"], APIConstants.apiKey)
    }

    func test_auth_request_new_auth_token_params_should_be_empty() {
        let request = AuthRequest.newAuthToken

        let params = request.params

        XCTAssertTrue(params.isEmpty)
    }

    func test_auth_request_new_auth_session_id_params_should_include_request_token() {
        let requestToken = "testToken"
        let request = AuthRequest.newAuthSessionId(requestToken: requestToken)

        let params = request.params

        XCTAssertEqual(params["request_token"] as? String, requestToken)
    }

    func test_auth_request_new_auth_token_request_type_should_be_get() {
        let request = AuthRequest.newAuthToken

        let requestType = request.requestType

        XCTAssertEqual(requestType, .GET)
    }

    func test_auth_request_new_auth_session_id_request_type_should_be_post() {
        let request = AuthRequest.newAuthSessionId(requestToken: "testToken")

        let requestType = request.requestType

        XCTAssertEqual(requestType, .POST)
    }
}
