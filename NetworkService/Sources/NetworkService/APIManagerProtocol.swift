//
//  APIManagerProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// `APIManagerProtocol` provides a contract for fetching raw data from a network request.
@available(iOS 13.0.0, *)
public protocol APIManagerProtocol: Sendable {

    /// Executes a network request and returns the response data.
    ///
    /// - Parameter components: The `RequestComponents` object that defines the details
    ///   of the network request to be performed.
    /// - Returns: The raw `Data` retrieved from the server.
    /// - Throws: A `NetworkError` if the request fails or the response is invalid.
    func requestData(with components: RequestComponents) async throws -> Data
}
