//
//  NetworkError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

public enum NetworkError: LocalizedError, Hashable, Sendable {
    case invalidURL
    case invalidHTTPURLResponse
    case httpResponse(code: Int)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLErrorDescription
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseErrorDescription
        case .httpResponse:
            return Texts.httpResponseErrorDescription
        }
    }

    public var failureReason: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLFailureReason
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseFailureReason
        case .httpResponse(let code):
            return Texts.httpResponseFailureReason(code)
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLRecoverySuggestion
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseRecoverySuggestion
        case .httpResponse:
            return Texts.httpResponseRecoverySuggestion
        }
    }

    public var helpAnchor: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURL
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponse
        case .httpResponse:
            return Texts.httpResponse
        }
    }
}
