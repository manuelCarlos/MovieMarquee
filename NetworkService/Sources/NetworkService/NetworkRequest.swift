//
//  NetworkRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

import TMDBData

public protocol NetworkRequest: Sendable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var hostPath: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAuthorizationToken: Bool { get }
}

// MARK: - Default Request Implementation

public extension NetworkRequest {

    var scheme: String {
        APIConstants.httpsScheme
    }
    var host: String {
        APIConstants.baseURL
    }

    var hostPath: String {
        APIConstants.baseURLPath
    }

    var addAuthorizationToken: Bool {
        true
    }

    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func makeRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = hostPath + path
        components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }

        return urlRequest
    }
}
