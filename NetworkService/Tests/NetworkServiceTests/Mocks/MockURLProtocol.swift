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

    // By returning `true` in canInit(with:) and returning the request here, we say we want MockURLProtocol to
    // intercept all the requests made by a URLSession.
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
