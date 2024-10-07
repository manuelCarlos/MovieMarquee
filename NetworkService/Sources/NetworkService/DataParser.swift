//
//  DataParser.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

final class DataParser {
    private let jsonDecoder: JSONDecoder

    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }

    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
