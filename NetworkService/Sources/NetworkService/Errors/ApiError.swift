//
//  ApiError.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

enum ApiError: Error {
    case forbidden              // Status code 403
    case notFound               // Status code 404
    case conflict               // Status code 409
    case internalServerError    // Status code 500
}
