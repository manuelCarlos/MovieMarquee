//
//  RequestManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// A class responsible for managing network requests and decoding responses.
///
/// `RequestManager` acts as a coordinator between `APIManager` for sending
/// network requests and `DataParser` for parsing the response data into strongly-typed
/// Swift models. It is designed to be thread-safe and conforms to `Sendable` for usage
/// in concurrent environments.
///
/// This class provides a high-level interface for executing requests and decoding the
/// responses, abstracting away the complexities of networking and parsing.
@available(iOS 15.0, *)
public final class RequestManager: Sendable, RequestManagerProtocol {

    /// The parser used for decoding network response data.
    public let parser = DataParser()

    /// The API manager responsible for executing network requests.
    public let apiManager: APIManagerProtocol

    /// Creates a new instance of `RequestManager`.
    ///
    /// - Parameter apiManager: An instance conforming to `APIManagerProtocol` for
    ///   executing network requests. Defaults to an instance of `APIManager`.
    public init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }

    /// Executes a network request and decodes the response into a specified type.
    ///
    /// - Parameter components: The `RequestComponents` containing details of the network request.
    /// - Returns: A decoded instance of the specified `Decodable` type.
    /// - Throws: An error if the request fails or the decoding is unsuccessful.
    public func decode<T: Decodable>(with components: RequestComponents) async throws -> T {
        let data = try await apiManager.requestData(with: components)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
