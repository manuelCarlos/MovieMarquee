//
//  RequestManagerProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

@available(iOS 15.0, *)
public protocol RequestManagerProtocol: Sendable {
    var parser: DataParser { get }
    var apiManager: APIManagerProtocol { get }
    func decode<T: Decodable>(with components: RequestComponents) async throws -> T
}
