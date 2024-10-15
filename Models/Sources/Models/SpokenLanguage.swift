//
//  SpokenLanguage.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct SpokenLanguage: Codable, Hashable, Sendable {
    public let englishName: String
    public let iso6391: String?
    public let name: String
}
