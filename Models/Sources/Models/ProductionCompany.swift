//
//  ProductionCompany.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct ProductionCompany: Codable, Identifiable, Hashable, Sendable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
