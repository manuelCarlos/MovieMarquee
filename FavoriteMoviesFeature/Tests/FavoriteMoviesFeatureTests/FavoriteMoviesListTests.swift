//
//  FavoriteMoviesListTests.swift
//  FavoriteMoviesFeatureTests
//
//  Created by Manuel Lopes on 17.10.24.
//

import XCTest
import SnapshotTesting

@testable import MoviesDB
@testable import FavoriteMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class FavoriteMoviesListTests: XCTestCase {

    func test_view_when_there_are_no_favorite_movies() {
        let sut = FavoriteMoviesList(favoriteMoviesDBStore: FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor()))

        let _ = verifySnapshot(
            of: sut,
            as: .wait(for: 2, on: .image(
                layout: .device(config: .iPhone13Mini)
            )),
            record: true
        )
    }

    func test_view_when_there_are_two_favorite_movies() async throws {
        let movieDBModelActor = MockMovieDBModelActor()
        movieDBModelActor.favoriteMovies = [.init(id: 1, name: "Movie 1"), .init(id: 2, name: "Movie 2")]
        let storage = FavoriteMoviesDBStore(movieDBModelStorage: movieDBModelActor)
        try await storage.loadAllMovies()

        let sut = FavoriteMoviesList(favoriteMoviesDBStore: storage)

        _ = verifySnapshot(
            of: sut,
            as: .wait(for: 2, on: .image(
                layout: .device(config: .iPhone13Mini)
            )),
            record: true
        )
    }
}

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

    func fetchFavoriteMovie(id: Int) async throws -> FavoriteMovie {
        if let movie = favoriteMovies.first(where: { $0.id == id }) {
            return movie
        } else {
            throw MoviesDBError.notFound
        }
    }
}
