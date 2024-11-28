//
//  FavoriteMoviesDBStore.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

@available(iOS 17.0, *)
/// A store for managing the favorite movies in the DB, providing asynchronous methods
/// to load, insert, and delete favorite movies records.
@Observable
public final class FavoriteMoviesDBStore: @unchecked Sendable {

    /// A list of all favorite movies in the store, synchronized with the DB.
    public private(set) var movies: [FavoriteMovie] = []

    /// A reference to the movie database model actor responsible for interacting with the underlying DB.
    /// This property is mutable to allow mocking during testing, but is semantically constant during normal use.
    /// Defaults to the shared instance of `MovieDBModelActor`.
    private var movieDBModelActor: MovieDBModelStorage = MovieDBModelActor.shared

    /// Initializes a new instance of `FavoriteMoviesDBStore`.
    public init() {}

    /// Asynchronously loads all favorite movies from the database and updates the `movies` array.
    ///
    /// This method's work should happen on a background thread. and will throw an assertion on debug builds if it doesn't.
    ///
    /// - Throws: An error if the movies cannot be loaded from the database.
    public func loadAllMovies() async throws {
        assert(!Thread.isMainThread, "This work should NOT be done in the main thread.")

        movies = try await movieDBModelActor.fetchAllFavoriteMovies()
    }

    /// Asynchronously fetches a favorite movie with the specified `id` from the database.
    ///
    /// This method's work should happen on a background thread. and will throw an assertion on debug builds if it doesn't.
    ///
    /// - Parameter id: The unique identifier of the movie to fetch.
    /// - Returns: The favorite movie with the specified `id`.
    /// - Throws: An error if the movie cannot be fetched.
    public func fetchMovie(with id: Int) async throws -> FavoriteMovie {
        assert(!Thread.isMainThread, "This work should NOT be done in the main thread.")

        return try await movieDBModelActor.fetchFavoriteMovie(with: id)
    }

    /// Asynchronously inserts a new favorite movie into the database, and reloads the movie list.
    ///
    /// This method's work should happen on a background thread. and will throw an assertion on debug builds if it doesn't.
    ///
    /// - Parameter movie: The `FavoriteMovie` instance to be inserted into the database.
    /// - Throws: An error if the movie cannot be inserted into the database.
    public func insertMovie(_ movie: FavoriteMovie) async throws {
        assert(!Thread.isMainThread, "This work should NOT be done in the main thread.")

        try await movieDBModelActor.insertFavoriteMovie(movie)
        try await loadAllMovies()
    }

    /// Asynchronously deletes the favorite movie with the specified `id` from the database, and updates the `movies` array.
    ///
    /// This method's work should happen on a background thread. and will throw an assertion on debug builds if it doesn't.
    ///
    /// - Parameter id: The unique identifier of the movie to delete.
    /// - Throws: An error if the movie cannot be deleted from the database.
    public func deleteMovie(with id: Int) async throws {
        assert(!Thread.isMainThread, "This work should NOT be done in the main thread.")

        try await movieDBModelActor.deleteFavoriteMovie(with: id)
        try await loadAllMovies()
    }

    /// Asynchronously deletes multiple favorite movies specified by their indices in the `movies` array,
    /// and reloads the movie list.
    ///
    /// This method's work should happen on a background thread. and will throw an assertion on debug builds if it doesn't.
    ///
    /// - Parameter indexSet: A set of indices corresponding to the movies to be deleted from the `movies` array.
    /// - Throws: An error if the movies cannot be deleted from the database.
    public func deleteMovies(indexSet: IndexSet) async throws {
        assert(!Thread.isMainThread, "This work should NOT be done in the main thread.")

        var moviesToDelete: [FavoriteMovie] = []
        for index in indexSet where index < movies.count {
            let movie = movies[index]
            moviesToDelete.append(movie)
        }
        try await movieDBModelActor.deleteFavoriteMovies(moviesToDelete)
        try await loadAllMovies()
    }

    #if DEBUG
    /// **NOT to be used in production**
    /// A special initializer for testing purposes that allows dependency injection of a mock database model actor.
    ///
    /// - Parameter movieDBModelStorage: A mock or alternative implementation of `MovieDBModelStorage` used for testing.
    init(movieDBModelStorage: MovieDBModelStorage) {
        movieDBModelActor = movieDBModelStorage
    }
    #endif
}
