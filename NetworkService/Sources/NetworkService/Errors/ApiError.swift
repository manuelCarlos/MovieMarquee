//
//  ApiError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

enum ApiError: Error {
    case forbidden              // Status code 403
    case notFound               // Status code 404
    case conflict               // Status code 409
    case internalServerError    // Status code 500
}

enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL

    var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return Texts.invalidServerResponseTitle
        case .invalidURL:
            return Texts.invalidURLTitle
        }
    }
}
