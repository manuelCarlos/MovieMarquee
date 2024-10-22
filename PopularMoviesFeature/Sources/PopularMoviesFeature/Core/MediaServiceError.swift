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
            return "There are no popular movies available."
        }
    }

    var failureReason: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "The server returned an empty list of popular movies."
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "Try refreshing the page or check back later."
        }
    }

    var helpAnchor: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "Make sure you're connected to the internet and the service is available."
        }
    }
}
