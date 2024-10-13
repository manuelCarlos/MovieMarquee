//
//  NetworkError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

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
