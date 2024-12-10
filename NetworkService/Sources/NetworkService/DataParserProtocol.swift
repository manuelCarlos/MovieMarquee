//
//  DataParserProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// A protocol defining a generic data parser for converting raw data into a model of a specified type.
/// Conforming types must be `Sendable`, allowing them to be safely used in concurrent contexts.
public protocol DataParserProtocol: Sendable {

    /// Parses raw data into a specified type that conforms to `Decodable`.
    ///
    /// - Parameter data: The raw `Data` object to parse.
    /// - Returns: An instance of type `T` that conforms to `Decodable`.
    /// - Throws: An error if the data cannot be parsed into the desired type.
    func parse<T: Decodable>(data: Data) throws -> T
}
