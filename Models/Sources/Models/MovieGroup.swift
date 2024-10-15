//
//  MovieGroup.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

public struct MovieGroup: Codable, Hashable, Sendable {
    public let backdropPath: String?
    public var id: Int
    public let name: String
    public let posterPath: String?
    public let overview: String?
}
