//
//  MovieGroup.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct MovieGroup: Codable, Hashable, Sendable {
    public let backdropPath: String?
    public var id: Int
    public let name: String
    public let posterPath: String?
    public let overview: String?

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case posterPath = "poster_path"
        case name
    }
}
