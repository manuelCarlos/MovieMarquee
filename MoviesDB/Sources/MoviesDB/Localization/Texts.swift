//
//  File.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 21.10.24.
//

import Foundation

enum Texts {

    // MARK: - Error Descriptions

    static let movieNotFoundErrorDescription = NSLocalizedString("movies_db_error_not_found_error_description_key",
                                                                 bundle: .module,
                                                                 value: "The requested movie could not be found.",
                                                                 comment: "Error description when the movie is not found in the database")

    // MARK: - Failure Reasons

    static let movieNotFoundFailureReason = NSLocalizedString("movies_db_error_not_found_failure_reason_key",
                                                              bundle: .module,
                                                              value: "The movie might have been removed or is unavailable in the database.",
                                                              comment: "Failure reason when the movie is not found in the database")

    // MARK: - Recovery Suggestions

    static let movieNotFoundRecoverySuggestion = NSLocalizedString("movies_db_error_not_found_recovery_suggestion_key",
                                                                   bundle: .module,
                                                                   value: "Try searching for another movie or check your internet connection.",
                                                                   comment: "Suggestion for recovering from a movie not found error")

    // MARK: - Help Anchors

    static let movieNotFoundHelpAnchor = NSLocalizedString("movies_db_error_not_found_help_anchor_key",
                                                           bundle: .module,
                                                           value: "For further assistance, contact support or visit the help center.",
                                                           comment: "Help anchor for movie not found error")
}
