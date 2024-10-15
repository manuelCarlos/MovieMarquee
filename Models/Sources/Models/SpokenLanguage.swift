//
//  SpokenLanguage.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct SpokenLanguage: Codable, Hashable, Sendable {

    public let englishName: String
    public let iso6391: String? // swiftlint:disable:this identifier_name
    public let name: String
}
