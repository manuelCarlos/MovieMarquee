//
//  Credits.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct Credits: Codable, Identifiable, Hashable, Sendable {
    public let cast, crew: [Cast]
    public let id: Int?
}
