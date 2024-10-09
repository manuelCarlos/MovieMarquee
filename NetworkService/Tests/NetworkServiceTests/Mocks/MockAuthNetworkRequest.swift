//
//  MockAuthNetworkRequest.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 08.10.24.
//

@testable import NetworkService

struct MockAuthNetworkRequest: AuthNetworkRequest {
    var path: String
    var requestType: RequestType
}
