//
//  FavoriteMovie.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

/// Public Sendable type that will be used by clients and possibly shared across different contexts.
/// This type mirrors the @Model class, which cannot be Sendable by design.
public struct FavoriteMovie: Identifiable, Hashable, Sendable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
