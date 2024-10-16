//
//  FavoriteMoviesDBStore.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation

@available(iOS 17.0, *)
@Observable
public final class FavoriteMoviesDBStore: @unchecked Sendable {

    public var movies: [FavoriteMovie] = []

    @MainActor
    private let movieDBService: MovieDBService = .shared

    @MainActor
    public init() {}

    public func loadFavoriteMovies() async throws {
        movies = (try? movieDBService.fetchFavoriteMovies()) ?? []
    }

    public func addFavorite(_ movie: FavoriteMovie) throws {
        try movieDBService.addFavorite(movie)
        movies = (try? movieDBService.fetchFavoriteMovies()) ?? []
    }

    public func deleteFavorite(id: Int) throws {
        try movieDBService.deleteFavorite(with: id)
        movies = (try? movieDBService.fetchFavoriteMovies()) ?? []
    }

    public func getMovie(id: Int) -> FavoriteMovie? {
        return movieDBService.getMovie(id: id)
    }
}
