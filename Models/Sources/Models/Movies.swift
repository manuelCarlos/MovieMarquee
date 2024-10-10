//
//  Movies.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct Movies: Codable, Hashable, Sendable {
    let dates: Dates?
    let page: Int
    public let results: [Movie]
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case dates
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
