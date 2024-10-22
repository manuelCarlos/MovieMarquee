//
//  APIManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

@available(iOS 13.0.0, *)
public protocol APIManagerProtocol: Sendable {
    func initRequest(with data: NetworkRequest) async throws -> Data
}

@available(iOS 15.0, *)
public final actor APIManager: APIManagerProtocol {
    private let urlSession: URLSession

    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    public func initRequest(with data: NetworkRequest) async throws -> Data {
        let (data, response) = try await urlSession.data(for: data.makeRequest())
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidHTTPURLResponse // TODO: - LOg
        }
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.httpResponse(code: httpResponse.statusCode) // TODO: - LOg
        }
        return data
    }
}
