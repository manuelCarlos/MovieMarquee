//
//  FavoriteMoviesDBStore.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17.0, *)
@Observable
public final class FavoriteMoviesDBStore: @unchecked Sendable {

    public var movies: [FavoriteMovie] = []

    /// This property is semantically a constant. it's only mutable to allow easy mocking of the movieDBModelActor for testing purposes.
    private var movieDBModelActor: MovieDBModelStorage = MovieDBModelActor.shared

    public init() {}

    public func loadAllMovies() async throws {
        movies = await (try? movieDBModelActor.fetchFavoriteMovies()) ?? []
    }

    public func addMovie(_ movie: FavoriteMovie) async throws {
        try await movieDBModelActor.addFavoriteMovie(movie)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }

    public func deleteMovie(with id: Int) async throws {
        try await movieDBModelActor.deleteFavoriteMovie(with: id)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }

    public func fetchMovie(with id: Int) async throws -> FavoriteMovie? {
        return await movieDBModelActor.fetchFavoriteMovie(id: id)
    }

#if DEBUG
    init(movieDBModelActor: MovieDBModelStorage) {
        self.movieDBModelActor = movieDBModelActor
    }
#endif
}
