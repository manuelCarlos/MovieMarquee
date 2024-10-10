//
//  RequestManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

@available(iOS 15.0, *)
public final class RequestManager: Sendable, RequestManagerProtocol {

    public let parser: DataParser = DataParser()
    public let apiManager: APIManagerProtocol

    public init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }

    public func decode<T: Decodable>(networkRequest data: NetworkRequest) async throws -> T {
        let data = try await apiManager.initRequest(with: data)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
