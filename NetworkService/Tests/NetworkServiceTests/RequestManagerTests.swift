//
//  File.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

import XCTest
@testable import NetworkService

@available(iOS 15.0, *)
final class RequestManagerTests: XCTestCase {

    private var mockAPIManager: MockAPIManager!
    private var requestManager: RequestManager!

    override func setUp() {
        super.setUp()

        mockAPIManager = MockAPIManager()
        requestManager = RequestManager(apiManager: mockAPIManager)
    }

    override func tearDown() {
        mockAPIManager = nil
        requestManager = nil
        super.tearDown()
    }

    func test_decode_valid_data_successful_parsing() async throws {
        let json = """
        {
            "id": 1,
            "name": "John Doe"
        }
        """
        let jsonData = Data(json.utf8)
        mockAPIManager.dataToReturn = jsonData
        let networkRequest = MockNetworkRequest.make()

        let result: MockResponse = try await requestManager.decode(networkRequest: networkRequest)

        let expectedResponse = MockResponse(id: 1, name: "John Doe")
        XCTAssertEqual(result, expectedResponse)
    }

    func test_decode_invalid_json_throws_decoding_error() async throws {
        let invalidJsonData = Data("Invalid JSON Data".utf8)
        mockAPIManager.dataToReturn = invalidJsonData
        let networkRequest = MockNetworkRequest.make()

        do {
            _ = try await requestManager.decode(networkRequest: networkRequest) as MockResponse
            XCTFail("Expected to throw DecodingError, but no error was thrown.")
        } catch {
            XCTAssertTrue(error is DecodingError, "Expected DecodingError but got \(error)")
        }
    }

    func test_decode_api_manager_throws_network_error() async throws {
        mockAPIManager.errorToThrow = NetworkError.invalidServerResponse
        let networkRequest = MockNetworkRequest.make()

        do {
            _ = try await requestManager.decode(networkRequest: networkRequest) as MockResponse
            XCTFail("Expected to throw NetworkError, but no error was thrown.")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.invalidServerResponse)
        }
    }

    // MARK: - Sample Decodable struct for testing

    private struct MockResponse: Decodable, Equatable {
        let id: Int
        let name: String
    }
}
