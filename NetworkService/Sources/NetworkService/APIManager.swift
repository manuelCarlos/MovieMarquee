//
//  APIManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation
import os.log

/// `APIManagerProtocol` provides a contract for fetching raw data from a network request.
@available(iOS 13.0.0, *)
public protocol APIManagerProtocol: Sendable {

    /// Executes a network request and returns the response data.
    ///
    /// - Parameter components: The `RequestComponents` object that defines the details
    ///   of the network request to be performed.
    /// - Returns: The raw `Data` retrieved from the server.
    /// - Throws: A `NetworkError` if the request fails or the response is invalid.
    func requestData(with components: RequestComponents) async throws -> Data
}

/// An actor for managing network requests using `URLSession`.
///
/// `APIManager` conforms to `APIManagerProtocol` and provides a concrete implementation
/// for performing network operations. It leverages `URLSession` for HTTP requests and validates
/// responses before returning the data.
@available(iOS 15.0, *)
public final actor APIManager: APIManagerProtocol {

    private let logger = Logger(subsystem: "NetworkService.Package", category: "APIManager")
    private let urlSession: URLSession

    /// Creates a new instance of `APIManager`.
    ///
    /// - Parameter urlSession: The `URLSession` instance to use for executing network requests.
    ///   Defaults to `URLSession.shared`.
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    /// Executes a network request and validates the response.
    ///
    /// - Parameter components: The `RequestComponents` containing details of the network request.
    /// - Returns: The raw `Data` returned from the server.
    /// - Throws: A `NetworkError` if the response is invalid or if the request fails.
    public func requestData(with components: RequestComponents) async throws -> Data {
        let urlRequest = try components.makeURLRequest()
        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            logger.error("Invalid HTTPURLResponse")
            throw NetworkError.invalidHTTPURLResponse
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            logger.error("Request to \(urlRequest.url?.absoluteString ?? "unknown URL") failed with status code \(httpResponse.statusCode)")
            throw NetworkError.httpResponse(code: httpResponse.statusCode)
        }
        return data
    }
}
