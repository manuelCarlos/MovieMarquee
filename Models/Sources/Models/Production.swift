//
//  Production.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct Production: Codable, Hashable, Sendable {
    let iso3166_1: String // swiftlint:disable:this identifier_name
    let name: String
}
