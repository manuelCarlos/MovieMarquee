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
            return Texts.Errors.NotFound.errorDescription
        }
    }

    var failureReason: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.failureReason
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.recoverySuggestion
        }
    }

    var helpAnchor: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.helpAnchor
        }
    }
}
