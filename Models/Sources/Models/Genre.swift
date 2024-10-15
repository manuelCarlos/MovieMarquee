//
//  Genre.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct Genre: Codable, Identifiable, Hashable, Sendable {
    public let id: Int
    public let name: String
}
