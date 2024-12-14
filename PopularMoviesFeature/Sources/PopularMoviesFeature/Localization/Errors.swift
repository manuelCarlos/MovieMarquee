//
//  Errors.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.12.24.
//

import Foundation

extension Texts {

    enum MediaServiceError {

        enum NoPopularMoviesAvailable {

            static let errorDescription = NSLocalizedString(
                "popular_movies_feature_no_popular_movies_available_key",
                bundle: .module,
                value: "There are no popular movies available.",
                comment: "Title error when there are no popular movies available."
            )

            static let failureReason = NSLocalizedString(
                "popular_movies_feature_no_popular_movies_available_failure_reason_key",
                bundle: .module,
                value: "The server returned an empty list of popular movies.",
                comment: "Failure reason for no popular movies available error."
            )

            static let recoverySuggestion = NSLocalizedString(
                "popular_movies_feature_no_popular_movies_available_recovery_suggestion_key",
                bundle: .module,
                value: "Try refreshing the page or check back later.",
                comment: "Recovery suggestion for no popular movies available error."
            )

            static let helpAnchor = NSLocalizedString(
                "popular_movies_feature_no_popular_movies_available_help_anchor_key",
                bundle: .module,
                value: "Make sure you're connected to the internet and the service is available.",
                comment: "Help anchor for no popular movies available error."
            )
        }
    }
}
