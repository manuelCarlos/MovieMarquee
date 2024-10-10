//
//  DataParser.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

public final class DataParser: Sendable {
    private let jsonDecoder: JSONDecoder

    public init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }

    public func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
