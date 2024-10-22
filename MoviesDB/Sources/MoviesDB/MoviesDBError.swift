//
//  MoviesDBError.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

enum MoviesDBError: LocalizedError, Hashable, Sendable {
    case notFound

    // MARK: - LocalizedError

    var errorDescription: String? {
        switch self {
        case .notFound:
            return Texts.movieNotFoundErrorDescription
        }
    }

    var failureReason: String? {
        switch self {
        case .notFound:
            return Texts.movieNotFoundFailureReason
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .notFound:
            return Texts.movieNotFoundRecoverySuggestion
        }
    }

    var helpAnchor: String? {
        switch self {
        case .notFound:
            return Texts.movieNotFoundHelpAnchor
        }
    }
}
