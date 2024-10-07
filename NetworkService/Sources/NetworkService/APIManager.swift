//
//  APIManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

protocol APIManagerProtocol {
    func initRequest(with data: NetworkRequest) async throws -> Data
}

@available(iOS 15.0, *)
final class APIManager: APIManagerProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func initRequest(with data: NetworkRequest) async throws -> Data {
        let (data, response) = try await urlSession.data(for: data.makeRequest())
        guard let httpResponse = response as? HTTPURLResponse else {
            assertionFailure("Invalid HTTPURL response")
            throw NetworkError.invalidServerResponse
        }
        guard httpResponse.statusCode == 200 else {
            assertionFailure("Invalid status code: \(httpResponse.statusCode)")
            throw NetworkError.invalidServerResponse
        }
        return data
    }
}
