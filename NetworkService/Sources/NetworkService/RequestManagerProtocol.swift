//
//  RequestManagerProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

@available(iOS 15.0, *)
protocol RequestManagerProtocol {
    var apiManager: APIManagerProtocol { get }
    var parser: DataParser { get }
    func decode<T: Decodable>(networkRequest data: NetworkRequest) async throws -> T
}
