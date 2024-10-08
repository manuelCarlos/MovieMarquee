//
//  AuthRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import Foundation

enum AuthRequest: NetworkRequest {

    case newAuthToken
    case newAuthSessionId(requestToken: String)

    var path: String {
        switch self {
        case .newAuthToken:
            return "/authentication/token/new"
        case .newAuthSessionId:
            return "/authentication/session/new"
        }
    }

    var urlParams: [String: String?] {
        switch self {
        case .newAuthToken:
            return ["api_key": APIConstants.apiKey ]
        case .newAuthSessionId:
            return ["api_key": APIConstants.apiKey ]
        }
    }

    var params: [String: Any] {
        switch self {
        case .newAuthToken:
            return [:]
        case .newAuthSessionId(let requestToken):
            return ["request_token": requestToken ]
        }
    }

    var requestType: RequestType {
        switch self {
        case .newAuthToken:
            return .GET
        case .newAuthSessionId:
            return .POST
        }
    }
}
