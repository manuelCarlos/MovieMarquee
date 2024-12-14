//
//  MediaServiceError.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

enum MediaServiceError: LocalizedError {
    case noPopularMoviesAvailable

    // MARK: - LocalizedError Properties

    var errorDescription: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return Texts.MediaServiceError.NoPopularMoviesAvailable.errorDescription
        }
    }

    var failureReason: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return Texts.MediaServiceError.NoPopularMoviesAvailable.failureReason
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return Texts.MediaServiceError.NoPopularMoviesAvailable.recoverySuggestion
        }
    }

    var helpAnchor: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return Texts.MediaServiceError.NoPopularMoviesAvailable.helpAnchor
        }
    }
}
