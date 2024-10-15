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
    public let imdbId: String?
    public let knownForDepartment: Department?
    public let name: String
    public let placeOfBirth: String?
    public let popularity: Double
    public let profilePath: String?
}
