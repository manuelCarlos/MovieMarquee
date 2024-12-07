//
//  RequestManagerProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// A protocol for managing network requests and decoding responses into Swift types.
///
/// `RequestManagerProtocol` provides a contract for implementing classes or actors that handle
/// network operations and response decoding. It integrates with an `APIManagerProtocol` instance
/// for fetching data and a `DataParser` instance for decoding the data into `Decodable` types.
///
/// Conformance to `Sendable` ensures that implementations of this protocol can be used safely
/// in concurrent contexts.
@available(iOS 15.0, *)
public protocol RequestManagerProtocol: Sendable {

    /// The parser used for decoding network response data.
    var parser: DataParser { get }

    /// The API manager responsible for executing network requests.
    var apiManager: APIManagerProtocol { get }

    /// Executes a network request and decodes the response into a specified type.
    ///
    /// - Parameter components: The `RequestComponents` containing details of the network request.
    /// - Returns: A decoded instance of the specified `Decodable` type.
    /// - Throws: An error if the request fails or the decoding is unsuccessful.
    func decode<T: Decodable>(with components: RequestComponents) async throws -> T
}
