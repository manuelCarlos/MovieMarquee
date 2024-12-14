//
//  MockURLProtocol.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.12.24.
//
import Foundation

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
            assertionFailure("No request handler closure set.")
            return
        }
        do {
            let (response, data) = try handler(request)

            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            assertionFailure("Error handling the request: \(error)")
        }
    }
    override func stopLoading() {}
}
