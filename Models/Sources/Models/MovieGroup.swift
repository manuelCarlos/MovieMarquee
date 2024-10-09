//
//  MovieGroup.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct MovieGroup: Codable, Hashable, Sendable {
    let backdropPath: String?
    var id: Int
    let name: String
    let posterPath: String?
    let overview: String?

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case posterPath = "poster_path"
        case name
    }
}
