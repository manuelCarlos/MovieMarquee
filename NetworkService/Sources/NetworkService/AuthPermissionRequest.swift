//
//  AuthPermissionRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

enum AuthPermissionRequest: AuthNetworkRequest {
    case askUserPermission(requestToken: String)

    var path: String {
        switch self {
        case .askUserPermission(let requestToken):
            return "/authenticate/\(requestToken)"
        }
    }

    var urlParams: [String: String?] {
        switch self {
        case .askUserPermission:
            return [:]
        }
    }

    var params: [String: Any] {
        switch self {
        case .askUserPermission:
            return [:]
        }
    }

    var requestType: RequestType {
        switch self {
        case .askUserPermission:
            return .GET
        }
    }
}
