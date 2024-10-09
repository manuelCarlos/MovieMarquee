//
//  Company.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct Company: Codable, Identifiable, Hashable, Sendable {
    let id: Int
    let name: String
    let logoPath: String
    let originCountry: String
}
