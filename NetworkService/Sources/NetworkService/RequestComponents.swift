//
//  RequestComponents.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

import TMDBData

/// A protocol defining the structure of a network request.
///
/// `RequestComponents` encapsulates the necessary elements for constructing a network request,
/// including the scheme, host, path, etc.
public protocol RequestComponents: Sendable {

    /// The URL scheme (e.g., "http" or "https").
    var scheme: String { get }

    /// The base host/domain for the URL.
    var host: String { get }

    /// The specific path for the resource being requested (e.g., "/movie/popular").
    var path: String { get }

    /// The full host path, typically the base URL or endpoint (e.g., "https://api.themoviedb.org").
    var hostPath: String { get }

    /// The HTTP request method used (e.g., GET, POST).
    var requestType: RequestType { get }

    /// Any custom HTTP headers to include in the request.
    var headers: [String: String] { get }

    /// The body parameters to include in the request, typically for POST or PUT requests.
    var params: [String: Any] { get }

    /// The URL query parameters to append to the request URL.
    var urlParams: [String: String?] { get }

    /// A flag indicating whether an authorization token should be included in the request.
    var addAuthorizationToken: Bool { get }
}

// MARK: - Default Request Implementation

public extension RequestComponents {

    /// The default scheme for requests (usually "https").
    var scheme: String {
        APIConstants.httpsScheme
    }

    /// The default host for requests (e.g., API's base URL).
    var host: String {
        APIConstants.baseURL
    }

    /// The default host path (base URL path for the API).
    var hostPath: String {
        APIConstants.baseURLPath
    }

    /// Indicates whether an authorization token should be included in the request.
    /// The default is `true`, meaning the token will be included unless specified otherwise.
    var addAuthorizationToken: Bool {
        true
    }

    /// Default empty body parameters for requests (usually POST or PUT).
    var params: [String: Any] {
        [:]
    }

    /// Default empty URL query parameters.
    var urlParams: [String: String?] {
        [:]
    }

    /// Default empty HTTP headers.
    var headers: [String: String] {
        [:]
    }

    /// Constructs and returns a `URLRequest` based on the components provided by the conforming type.
    ///
    /// - Returns: A fully constructed `URLRequest` object with the provided URL, method, headers, and body.
    /// - Throws: `NetworkError.invalidURL` if the URL components cannot form a valid URL.
    func makeURLRequest() throws -> URLRequest {
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
