//
//  MovieDBModelActorTests.swift
//  MoviesDBTests
//
//  Created by Manuel Lopes on 16.10.24.
//

import XCTest
import SwiftData

@testable import MoviesDB

@available(iOS 17.0, *)
final class MovieDBModelActorTests: XCTestCase {

    private var modelActor: MovieDBModelActor!

    override func setUpWithError() throws {
        try super.setUpWithError()

        // In-memory ModelContainer setup for testing
        let schema = Schema([FavoriteMovieModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

        modelActor = MovieDBModelActor(modelContainer: modelContainer)
    }

    override func tearDownWithError() throws {
        modelActor = nil

        try super.tearDownWithError()
    }

    // MARK: - Fetching movies from DB

    func test_fetch_favorite_movies() async throws {
        let favoriteMovies = [
            FavoriteMovie(id: 1, name: "Inception"),
            FavoriteMovie(id: 2, name: "Interstellar")
        ]

        for movie in favoriteMovies {
            try await modelActor.insertFavoriteMovie(movie)
        }

        let fetchedMovies = try await modelActor.fetchAllFavoriteMovies()

        XCTAssertEqual(fetchedMovies.count, 2)
        XCTAssertTrue(fetchedMovies.contains { $0.id == 1 && $0.name == "Inception" })
        XCTAssertTrue(fetchedMovies.contains { $0.id == 2 && $0.name == "Interstellar" })
    }

    func test_fetch_favorite_movie_not_found() async throws {
        let nonExistentId = 999

        await assertThrowsAsyncError(
            try await modelActor.fetchFavoriteMovie(with: nonExistentId)
        ) { error in
            XCTAssertEqual(error as? MoviesDBError, MoviesDBError.notFound)
        }
    }

    // MARK: - Inserting fav movies to DB

    func test_inserting_favorite_movie() async throws {
        let favoriteMovie = FavoriteMovie(id: 111, name: "Inception")

        try await modelActor.insertFavoriteMovie(favoriteMovie)

        let fetchedMovie = try await modelActor.fetchFavoriteMovie(with: favoriteMovie.id)
        XCTAssertEqual(fetchedMovie.id, 111)
        XCTAssertEqual(fetchedMovie.name, "Inception")
    }

    func test_upserting_favorite_movie() async throws {
        let inception = FavoriteMovie(id: 111, name: "Inception")

        try await modelActor.insertFavoriteMovie(inception)

        let fetchedMovie = try await modelActor.fetchFavoriteMovie(with: inception.id)
        XCTAssertEqual(fetchedMovie.id, 111)
        XCTAssertEqual(fetchedMovie.name, "Inception")

        // Insert movie with the same `id` to test updating the name.
        let memento = FavoriteMovie(id: 111, name: "Memento")

        try await modelActor.insertFavoriteMovie(memento)

        let fetchedMovies = try await modelActor.fetchAllFavoriteMovies()
        XCTAssertEqual(fetchedMovies.count, 1)
        XCTAssertEqual(fetchedMovies.first?.name, "Memento")
    }

    // MARK: - Deleting fav movies from DB

    func test_delete_favorite_movie() async throws {
        let favoriteMovie = FavoriteMovie(id: 222, name: "Inception")
        try await modelActor.insertFavoriteMovie(favoriteMovie)

        let fetchedMovie = try await modelActor.fetchFavoriteMovie(with: favoriteMovie.id)
        XCTAssertEqual(fetchedMovie.id, favoriteMovie.id)

        try await modelActor.deleteFavoriteMovie(with: favoriteMovie.id)

        await assertThrowsAsyncError(
            try await modelActor.fetchFavoriteMovie(with: favoriteMovie.id)
        ) { error in
            XCTAssertEqual(error as? MoviesDBError, MoviesDBError.notFound)
        }
    }

    func test_delete_multiple_favorite_movies() async throws {
        let favoriteMovies = [
            FavoriteMovie(id: 222, name: "Inception"),
            FavoriteMovie(id: 333, name: "Interstellar")
        ]
        try await modelActor.insertFavoriteMovie(favoriteMovies.first!)
        try await modelActor.insertFavoriteMovie(favoriteMovies.last!)

        let movies = try await modelActor.fetchAllFavoriteMovies()
        XCTAssertEqual(movies.count, 2)
        XCTAssertEqual(movies.first?.id, 222)
        XCTAssertEqual(movies.last?.id, 333)

        try await modelActor.deleteFavoriteMovies(favoriteMovies)
        let fetchedMovies = try await modelActor.fetchAllFavoriteMovies()

        XCTAssertEqual(fetchedMovies.count, 0)
        await assertThrowsAsyncError(
            try await modelActor.fetchFavoriteMovie(with: 222)
        ) { error in
            XCTAssertEqual(error as? MoviesDBError, MoviesDBError.notFound)
        }
    }
}
