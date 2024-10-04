//
//  FetchError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 04.10.24.
//

import Foundation

public enum FetchError: LocalizedError {
    case networkError
    
    public var errorDescription: String? {
        switch self {
        case .networkError:
            return Texts.networkErrorDescription
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .networkError:
            return Texts.networkErrorRecoverySuggestion
        }
    }
}
