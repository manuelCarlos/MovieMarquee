//
//  MockMovieDBModelActor.swift
//  MoviesDBTests
//
//  Created by Manuel Lopes on 17.10.24.
//

import Foundation

@testable import MoviesDB

final class MockMovieDBModelActor: MovieDBModelStorage {

    var favoriteMovies: [FavoriteMovie] = []
    var shouldThrowError = false

    func fetchFavoriteMovies() async throws -> [FavoriteMovie] {
        if shouldThrowError {
            throw MoviesDBError.notFound
        }
        return favoriteMovies
    }

    func addFavoriteMovie(_ movie: FavoriteMovie) async throws {
        if shouldThrowError {
            throw MoviesDBError.notFound
        }
        guard !favoriteMovies.contains(movie) else {
            return
        }
        favoriteMovies.append(movie)
    }

    func deleteFavoriteMovie(with id: Int) async throws {
        if shouldThrowError {
            throw MoviesDBError.notFound
        }
        favoriteMovies.removeAll { $0.id == id }
    }

    func fetchFavoriteMovie(id: Int) async -> FavoriteMovie? {
        return favoriteMovies.first { $0.id == id }
    }
}
