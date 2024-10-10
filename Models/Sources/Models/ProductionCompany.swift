//
//  ProductionCompany.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct ProductionCompany: Codable, Identifiable, Hashable, Sendable {
    public let id: Int
    public let logoPath: String?
    public let name, originCountry: String

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
