//
//  RequestManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// An object responsible for managing network requests and decoding responses.
@available(iOS 15.0, *)
public final class RequestManager: Sendable, RequestManagerProtocol {

    /// The parser used for decoding network response data.
    public let parser: DataParserProtocol

    /// The API manager responsible for executing network requests.
    public let apiManager: APIManagerProtocol

    /// Initializes a new instance with the specified parser and API manager.
    ///
    /// - Parameters:
    ///   - parser: An object conforming to the `DataParserProtocol` that is used to parse data.
    ///             The default is an instance of `DataParser`.
    ///   - apiManager: An object conforming to the `APIManagerProtocol`.
    ///                 The default is an instance of `APIManager`.
    public init(parser: DataParserProtocol = DataParser(),
                apiManager: APIManagerProtocol = APIManager()) {
        self.parser = parser
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
