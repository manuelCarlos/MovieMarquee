//
//  MovieCollection.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct MovieCollection: Codable, Identifiable, Hashable, Sendable {
    public var id: Int
    public let backdropPath: String?
    public let name: String
    public let posterPath: String?
    public let overview: String?
}
