//
//  MockMovieDBModelActor.swift
//  FavoriteMoviesFeatureTests
//
//  Created by Manuel Lopes on 17.10.24.
//

@testable import MoviesDB

final class MockMovieDBModelActor: MovieDBModelStorage {

    var favoriteMovies: [FavoriteMovie] = []
    var shouldThrowError = false

    func fetchAllFavoriteMovies() async throws -> [FavoriteMovie] {
        if shouldThrowError {
            throw MoviesDBError.notFound
        }
        return favoriteMovies
    }

    func fetchFavoriteMovie(with id: Int) async throws -> FavoriteMovie {
        if let movie = favoriteMovies.first(where: { $0.id == id }) {
            return movie
        } else {
            throw MoviesDBError.notFound
        }
    }

    func insertFavoriteMovie(_ movie: FavoriteMovie) async throws {
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

    func deleteFavoriteMovies(_ movies: [MoviesDB.FavoriteMovie]) async throws {
        if shouldThrowError {
            throw MoviesDBError.notFound
        }
        favoriteMovies.removeAll(where: { movies.contains($0) })
    }
}
