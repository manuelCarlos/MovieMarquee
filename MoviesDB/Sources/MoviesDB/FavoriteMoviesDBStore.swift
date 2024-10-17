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

    public private(set) var movies: [FavoriteMovie] = []

    /// This property is semantically constant.
    /// It's only a `var` to allow easy mocking of the movieDBModelActor for testing purposes.
    private var movieDBModelActor: MovieDBModelStorage = MovieDBModelActor.shared

    public init() {}

    public func loadAllMovies() async throws {
        movies = try await movieDBModelActor.fetchAllFavoriteMovies()
    }

    public func fetchMovie(with id: Int) async throws -> FavoriteMovie {
        return try await movieDBModelActor.fetchFavoriteMovie(with: id)
    }

    public func addMovie(_ movie: FavoriteMovie) async throws {
        try await movieDBModelActor.addFavoriteMovie(movie)
        try await loadAllMovies()
    }

    public func deleteMovie(with id: Int) async throws {
        try await movieDBModelActor.deleteFavoriteMovie(with: id)
        try await loadAllMovies()
    }

    public func deleteMovies(indexSet: IndexSet) async throws {
        var moviesToDelete: [FavoriteMovie] = []
        for index in indexSet where index < movies.count {
            let movie = movies[index]
            moviesToDelete.append(movie)
        }
        try await movieDBModelActor.deleteFavoriteMovies(moviesToDelete)
        try await loadAllMovies()
    }

#if DEBUG
    init(movieDBModelStorage: MovieDBModelStorage) {
        movieDBModelActor = movieDBModelStorage
    }
#endif
}
