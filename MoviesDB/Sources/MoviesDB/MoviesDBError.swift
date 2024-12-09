//
//  MoviesDBError.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

package enum MoviesDBError: LocalizedError, Hashable, Sendable {
    case notFound

    // MARK: - LocalizedError

    package var errorDescription: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.errorDescription
        }
    }

    package var failureReason: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.failureReason
        }
    }

    package var recoverySuggestion: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.recoverySuggestion
        }
    }

    package var helpAnchor: String? {
        switch self {
        case .notFound:
            return Texts.Errors.NotFound.helpAnchor
        }
    }
}
