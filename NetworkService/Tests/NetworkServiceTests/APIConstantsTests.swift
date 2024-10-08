//
//  APIConstantsTests.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation
import XCTest

@testable import NetworkService

final class APIConstantsTests: XCTestCase {

    private let testBundle = Bundle.module // Reference to the test bundle

    // Test if baseURL is correct
    func test_base_url_is_correct() {
        XCTAssertEqual(APIConstants.baseURL, "api.themoviedb.org")
    }

    // Test if baseURLPath is correct
    func test_base_url_path_is_correct() {
        XCTAssertEqual(APIConstants.baseURLPath, "/3")
    }

    // Test if authURL is correct
    func test_auth_url_is_correct() {
        XCTAssertEqual(APIConstants.authURL, "www.themoviedb.org")
    }

    func test_auth_url_path_is_correct() {
        XCTAssertEqual(APIConstants.authURLPath, "")
    }

    func test_default_scheme_is_correct() {
        XCTAssertEqual(APIConstants.defaultScheme, "https://")
    }

    func test_base_img_url_is_correct() {
        XCTAssertEqual(APIConstants.baseImgUrl, "image.tmdb.org")
    }

    func test_base_img_url_path_is_correct() {
        XCTAssertEqual(APIConstants.baseImgUrlPath, "/t/p/w500")
    }

    func test_language_is_correct() {
        XCTAssertEqual(APIConstants.language, "en-US")
    }

     func test_load_api_key_with_valid_file_in_test_bundle() {
         // Assuming there's a file named `apiKey.json` in the test bundle
         let apiKey = APIConstants.loadAPIKey(from: testBundle, jsonFileName: "mockedApiKey")
         XCTAssertEqual(apiKey, "mocked_api_key") // Assuming the test file contains {"apiKey": "mocked_api_key"}
     }

     func test_load_api_key_with_missing_file_in_test_bundle() {
         let apiKey = APIConstants.loadAPIKey(from: testBundle, jsonFileName: "nonExistentFile")
         XCTAssertNil(apiKey)
     }

     func test_load_api_key_with_invalid_json_in_test_bundle() {
         // You can add an invalid JSON file to your test bundle for this case
         let apiKey = APIConstants.loadAPIKey(from: testBundle, jsonFileName: "invalidJSONFile")
         XCTAssertNil(apiKey)
     }

    func test_load_api_key_with_invalid_bundle() {
        XCTAssertNil(APIConstants.loadAPIKey(jsonFileName: "nonexistentFile"))
    }
}
