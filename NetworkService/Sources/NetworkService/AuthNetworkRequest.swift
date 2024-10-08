//
//  AuthNetworkRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import Foundation

protocol AuthNetworkRequest: NetworkRequest {}

extension AuthNetworkRequest {

    var host: String {
        APIConstants.authURL
    }

    var hostPath: String {
        APIConstants.authURLPath
    }
}
