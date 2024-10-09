//
//  SpokenLanguage.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct SpokenLanguage: Codable, Hashable, Sendable {
    let englishName, iso639_1, name: String // swiftlint:disable:this identifier_name

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1" // swiftlint:disable:this identifier_name
        case name
    }
}
