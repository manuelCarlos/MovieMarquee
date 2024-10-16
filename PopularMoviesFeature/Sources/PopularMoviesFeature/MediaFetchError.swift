//
//  MediaFetchError.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

enum MediaFetchError: LocalizedError {
    case noPopularMoviesAvailable
    case invalidData

    // MARK: - LocalizedError Properties

    var errorDescription: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "There are no popular movies available."
        case .invalidData:
            return "The data received was invalid."
        }
    }

    var failureReason: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "The server returned an empty list of popular movies."
        case .invalidData:
            return "The data could not be decoded as expected."
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "Try refreshing the page or check back later."
        case .invalidData:
            return "Please try again later or contact support."
        }
    }

    var helpAnchor: String? {
        switch self {
        case .noPopularMoviesAvailable:
            return "Make sure you're connected to the internet and the service is available."
        case .invalidData:
            return "Check if the app is up to date or reach out to support for assistance."
        }
    }
}
