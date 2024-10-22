//
//  File.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 21.10.24.
//

import Foundation

enum Texts {

    enum Errors {

        enum NotFound {
            static let errorDescription = NSLocalizedString("movies_db_error_not_found_error_description_key",
                                                            bundle: .module,
                                                            value: "The requested movie could not be found.",
                                                            comment: "Error description when the movie is not found in the database")

            static let failureReason = NSLocalizedString("movies_db_error_not_found_failure_reason_key",
                                                         bundle: .module,
                                                         value: "The movie might have been removed or is unavailable in the database.",
                                                         comment: "Failure reason when the movie is not found in the database")

            static let recoverySuggestion = NSLocalizedString("movies_db_error_not_found_recovery_suggestion_key",
                                                              bundle: .module,
                                                              value: "Try searching for another movie or check your internet connection.",
                                                              comment: "Suggestion for recovering from a movie not found error")

            static let helpAnchor = NSLocalizedString("movies_db_error_not_found_help_anchor_key",
                                                      bundle: .module,
                                                      value: "For further assistance, contact support or visit the help center.",
                                                      comment: "Help anchor for movie not found error")
        }
    }
}
