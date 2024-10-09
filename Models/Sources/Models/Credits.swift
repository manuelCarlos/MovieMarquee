//
//  Credits.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct Credits: Codable, Identifiable, Hashable, Sendable {
    let cast, crew: [Cast]
    let id: Int?
}

extension Credits {
    static let mock = Credits(cast: [], crew: [], id: 1)
}
