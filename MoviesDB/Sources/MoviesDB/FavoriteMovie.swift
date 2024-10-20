//
//  FavoriteMovie.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

/// Public Sendable type that contains the data related to the favorite movie DB model, and that can be shared across different contexts.
/// This type mirrors the DB @Model class (which cannot be Sendable by design).
public struct FavoriteMovie: Identifiable, Hashable, Sendable {
    /// The unique identifier for the favorite movie.
    /// This corresponds to the movie's ID in the database.
    public let id: Int

    /// The name or title of the favorite movie.
    public let name: String
    
    /// Initializes a new instance of `FavoriteMovie` with the specified `id` and `name`.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the movie.
    ///   - name: The title or name of the movie.
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
