//
//  MockURLProtocol.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import Foundation
import XCTest

final class MockURLProtocol: URLProtocol {

    // This is not concurrency-safe because it is nonisolated global shared mutable state - but for testing purposes it's acceptable
    nonisolated(unsafe) static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override static func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = Self.requestHandler else {
            XCTFail("No request handler closure set.")
            return
        }
        do {
            let (response, data) = try handler(request)

            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            XCTFail("Error handling the request: \(error)")
        }
    }
    override func stopLoading() {}
}
