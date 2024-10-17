//
//  MoviesDBError.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

enum MoviesDBError: LocalizedError {
    case notFound

    // MARK: - LocalizedError

    var errorDescription: String? {
        switch self {
        case .notFound:
            return "The requested movie could not be found."
        }
    }

    var failureReason: String? {
        switch self {
        case .notFound:
            return "The movie might have been removed or is unavailable in the database."
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .notFound:
            return "Try searching for another movie or check your internet connection."
        }
    }

    var helpAnchor: String? {
        switch self {
        case .notFound:
            return "For further assistance, contact support or visit the help center."
        }
    }
}
