//
//  MockAPIManager.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

@testable import NetworkService

final class MockAPIManager: APIManagerProtocol {
    var dataToReturn: Data?
    var errorToThrow: Error?

    func initRequest(with data: NetworkRequest) async throws -> Data {
        if let error = errorToThrow {
            throw error
        }
        return dataToReturn ?? Data()
    }
}
