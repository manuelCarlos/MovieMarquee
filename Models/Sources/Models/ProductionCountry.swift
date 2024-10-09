//
//  ProductionCountry.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct ProductionCountry: Codable, Hashable, Sendable {
    let iso3166_1, name: String // swiftlint:disable:this identifier_name

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case iso3166_1 = "iso_3166_1" // swiftlint:disable:this identifier_name
        case name
    }
}
