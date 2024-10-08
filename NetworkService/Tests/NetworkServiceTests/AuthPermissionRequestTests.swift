//
//  AuthPermissionRequestTests.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import XCTest

@testable import NetworkService

final class AuthPermissionRequestTests: XCTestCase {

    func test_auth_permission_request_path_should_include_request_token() {
        let requestToken = "testToken"
        let request = AuthPermissionRequest.askUserPermission(requestToken: requestToken)

        let path = request.path

        XCTAssertEqual(path, "/authenticate/\(requestToken)")
    }

    func test_auth_permission_request_url_params_should_be_empty() {
        let request = AuthPermissionRequest.askUserPermission(requestToken: "testToken")

        let urlParams = request.urlParams

        XCTAssertTrue(urlParams.isEmpty)
    }

    func test_auth_permission_request_params_should_be_empty() {
        let request = AuthPermissionRequest.askUserPermission(requestToken: "testToken")

        let params = request.params

        XCTAssertTrue(params.isEmpty)
    }

    func test_auth_permission_request_request_type_should_be_get() {
        let request = AuthPermissionRequest.askUserPermission(requestToken: "testToken")

        let requestType = request.requestType

        XCTAssertEqual(requestType, .GET)
    }
}
