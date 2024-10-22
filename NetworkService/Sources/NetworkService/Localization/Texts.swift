//
//  Texts.swift
//  NetworkService
//
//  Created by Manuel Lopes on 04.10.24.
//

import Foundation

/// Note that: SPM generates the resource_bundle_accessor `Bundle.module` only if the corresponding target contains resources.
/// The Resources folder MUST contain something and MUST NOT be an empty directory.
/// Further more, to have the compiler automatically add the localization keys to the string catalog:
/// 1.  the package manifest Has to include the `defaultLocalization: "en"` parameter
/// 2. Xcode build setting for the app target needs to have `Use Compiler to Extract  Swift strings` turned on.
enum Texts {

    // MARK: - Error Descriptions

    static let invalidURLErrorDescription = NSLocalizedString("network_error_invalid_url_error_description_key",
                                                              bundle: .module,
                                                              value: "Invalid URL error.",
                                                              comment: "Error description when an invalid URL error occurs")

    static let invalidHTTPURLResponseErrorDescription = NSLocalizedString("network_error_invalid_http_response_error_description_key",
                                                                          bundle: .module,
                                                                          value: "Invalid HTTP URL response.",
                                                                          comment: "Error description when an invalid HTTP URL response is received")

    static let httpResponseErrorDescription = NSLocalizedString("network_error_http_response_error_description_key",
                                                                bundle: .module,
                                                                value: "Received an HTTP error response.",
                                                                comment: "Error description when a non-success HTTP status code is received")

    // MARK: - Failure Reasons

    static let invalidURLFailureReason = NSLocalizedString("network_error_invalid_url_failure_reason_key",
                                                           bundle: .module,
                                                           value: "The URL provided was invalid.",
                                                           comment: "Failure reason for invalid URL error")

    static let invalidHTTPURLResponseFailureReason = NSLocalizedString("network_error_invalid_http_response_failure_reason_key",
                                                                       bundle: .module,
                                                                       value: "The server response was not a valid HTTP response.",
                                                                       comment: "Failure reason for invalid HTTP URL response")

    static func httpResponseFailureReason(_ code: Int) -> String {
        return String(format: NSLocalizedString("network_error_http_response_failure_reason_key",
                                                bundle: .module,
                                                value: "The server returned an HTTP error response with status code %d.",
                                                comment: "Failure reason for receiving an HTTP error response"),
                      code)
    }

    // MARK: - Recovery Suggestions

    static let invalidURLRecoverySuggestion = NSLocalizedString("network_error_invalid_url_recovery_suggestion_key",
                                                                bundle: .module,
                                                                value: "Please check the URL and try again.",
                                                                comment: "Suggestion to recover from invalid URL error")

    static let invalidHTTPURLResponseRecoverySuggestion = NSLocalizedString("network_error_invalid_http_response_recovery_suggestion_key",
                                                                            bundle: .module,
                                                                            value: "Try refreshing the page or check the server.",
                                                                            comment: "Suggestion to recover from invalid HTTP URL response")

    static let httpResponseRecoverySuggestion = NSLocalizedString("network_error_http_response_recovery_suggestion_key",
                                                                  bundle: .module,
                                                                  value: "Try again later, or contact support if the issue persists.",
                                                                  comment: "Suggestion to recover from HTTP error response")

    // MARK: - Help Anchors

    static let invalidURL = NSLocalizedString("network_error_invalid_url_help_anchor_key",
                                              bundle: .module,
                                              value: "Invalid URL",
                                              comment: "Help anchor for invalid URL error")

    static let invalidHTTPURLResponse = NSLocalizedString("network_error_invalid_http_response_help_anchor_key",
                                                          bundle: .module,
                                                          value: "Invalid HTTP URL Response",
                                                          comment: "Help anchor for invalid HTTP URL response error")

    static let httpResponse = NSLocalizedString("network_error_http_response_help_anchor_key",
                                                bundle: .module,
                                                value: "HTTP Response Error",
                                                comment: "Help anchor for HTTP error response")
}
