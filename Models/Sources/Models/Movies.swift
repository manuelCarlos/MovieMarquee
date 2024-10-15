//
//  Movies.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct Movies: Codable, Hashable, Sendable {
    public let dates: Dates?
    public let page: Int
    public let results: [Movie]
    public let totalPages, totalResults: Int?
}
