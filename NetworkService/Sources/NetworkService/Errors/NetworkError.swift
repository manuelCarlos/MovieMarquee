//
//  NetworkError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

/// `NetworkError` includes cases for invalid URLs, unexpected HTTP responses, and
/// specific HTTP response status codes. It conforms to `LocalizedError` to provide
/// user-friendly error descriptions, reasons, recovery suggestions, and help anchors.
/// Additionally, it conforms to `Hashable` for use in sets or dictionaries and `Sendable`
/// for safe usage in concurrent contexts.
public enum NetworkError: LocalizedError, Hashable, Sendable {

    /// Indicates that the URL provided is invalid.
    case invalidURL

    /// Indicates that the HTTP response received is not valid.
    case invalidHTTPURLResponse

    /// Represents an HTTP response with a specific status code.
    /// - Parameter code: The HTTP status code associated with the response.
    case httpResponse(code: Int)

    // MARK: - LocalizedError Conformance

    /// A localized description of the error.
    ///
    /// This property provides a short, user-friendly message describing the nature of the error.
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLErrorDescription
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseErrorDescription
        case .httpResponse:
            return Texts.httpResponseErrorDescription
        }
    }

    /// A localized string explaining the failure reason.
    ///
    /// This property provides detailed context about why the error occurred.
    public var failureReason: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLFailureReason
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseFailureReason
        case .httpResponse(let code):
            return Texts.httpResponseFailureReason(code)
        }
    }

    /// A localized string suggesting how to recover from the error.
    ///
    /// This property offers actionable advice to resolve or work around the error.
    public var recoverySuggestion: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURLRecoverySuggestion
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponseRecoverySuggestion
        case .httpResponse:
            return Texts.httpResponseRecoverySuggestion
        }
    }

    /// A localized string providing an anchor to relevant help documentation.
    ///
    /// This property links to further resources or documentation that might assist in resolving the error.
    public var helpAnchor: String? {
        switch self {
        case .invalidURL:
            return Texts.invalidURL
        case .invalidHTTPURLResponse:
            return Texts.invalidHTTPURLResponse
        case .httpResponse:
            return Texts.httpResponse
        }
    }
}
