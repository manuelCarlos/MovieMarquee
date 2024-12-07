//
//  RequestType.swift
//  NetworkService
//
//  Created by Manuel Lopes on 07.10.24.
//

import Foundation

/// An enumeration representing HTTP request methods.
///
/// `RequestType` encapsulates the HTTP methods used in network requests.
public enum RequestType: String, Hashable, Sendable {
    /// Represents an HTTP GET request.
    case get = "GET"
}
