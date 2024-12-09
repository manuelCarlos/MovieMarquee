//
//  MockURLProtocol.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 13.10.24.
//

import Foundation

final class MockURLProtocol: URLProtocol {

    nonisolated(unsafe) static var testURLs = [URL?: Data]()

    override static func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let url = request.url {
            if let data = MockURLProtocol.testURLs[url] {
                client?.urlProtocol(self, didLoad: data)
            }
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
