//
//  DataParser.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// A utility class for parsing data into Swift's `Decodable` types.
///
/// `DataParser` uses `JSONDecoder` to convert `Data` into specified model objects.
/// It defaults to a key decoding strategy of `.convertFromSnakeCase`,
public final class DataParser: Sendable {

    private let jsonDecoder: JSONDecoder

    /// Creates a new instance of `DataParser`.
    ///
    /// - Parameter jsonDecoder: A custom `JSONDecoder` instance to use for parsing.
    ///   If not provided, a default `JSONDecoder` is initialized with the key decoding
    ///   strategy set to `.convertFromSnakeCase`.
    public init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        self.jsonDecoder = jsonDecoder
    }

    /// Parses the given data into the specified `Decodable` type.
    ///
    /// - Parameter data: The data to parse, typically received from a network response or file.
    /// - Returns: An instance of the specified `Decodable` type.
    /// - Throws: An error if the decoding fails. Errors are typically of type `DecodingError`.
    ///
    /// - Example:
    ///   ```swift
    ///   struct User: Decodable {
    ///       let id: Int
    ///       let name: String
    ///   }
    ///
    ///   let dataParser = DataParser()
    ///   let user: User = try dataParser.parse(data: jsonData)
    ///   ```
    public func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
