//
//  MockAPIManager.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

@testable import NetworkService

final class MockAPIManager: @unchecked Sendable, APIManagerProtocol {
    var dataToReturn: Data?
    var errorToThrow: Error?

    func requestData(with components: RequestComponents) async throws -> Data {
        if let error = errorToThrow {
            throw error
        }
        return dataToReturn ?? Data()
    }
}
