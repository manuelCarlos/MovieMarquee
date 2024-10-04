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
            return "Cannot Fetch Popular Movies"
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .networkError:
            return "Due to a network or server issue, we couldn't fetch the data. Please try again later."
        }
    }
}
