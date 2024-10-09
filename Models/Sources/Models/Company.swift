//
//  Company.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct Company: Codable, Identifiable, Hashable, Sendable {
    var id: Int
    var name: String
    var logoPath: String
    var originCountry: String
}
