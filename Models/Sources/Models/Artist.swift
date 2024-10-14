//
//  Artist.swift
//  Models
//
//  Created by Manuel Lopes on 14.10.24.
//

public struct Artist: Codable, Hashable, Sendable {
    public let adult: Bool
    public let alsoKnownAs: [String]?
    public let biography: String?
    public let birthday, deathday: String?
    public let gender: Int?
    public let homepage: String?
    public let id: Int
    public let imdbID: String?
    let knownForDepartment: Department?
    public let name: String
    public let placeOfBirth: String?
    public let popularity: Double
    public let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, deathday, gender, homepage, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
}
