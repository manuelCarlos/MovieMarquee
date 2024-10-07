//
//  RequestManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

@available(iOS 15.0, *)
final class RequestManager: RequestManagerProtocol {

    let parser: DataParser = DataParser()
    let apiManager: APIManagerProtocol

    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }

    func decode<T: Decodable>(networkRequest data: NetworkRequest) async throws -> T {
        let data = try await apiManager.initRequest(with: data)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
