//
//  FavoriteMoviesDBStoreTests.swift
//  MoviesDBTests
//
//  Created by Manuel Lopes on 16.10.24.
//

import XCTest

@testable import MoviesDB

@available(iOS 17.0, *)
final class FavoriteMoviesDBStoreTests: XCTestCase {

    private var mockActor: MockMovieDBModelActor!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockActor = MockMovieDBModelActor()

    }

    override func tearDownWithError() throws {
        mockActor = nil

        try super.tearDownWithError()
    }

    // MARK: - Load movies from DB

    func test_loadAllMovies_successfully() async throws {
        mockActor.favoriteMovies = [FavoriteMovie(id: 1, name: "Test Movie")]

        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)
        try await store.loadAllMovies()

        XCTAssertEqual(store.movies.count, 1)
        XCTAssertEqual(store.movies.first?.name, "Test Movie")
    }

    func test_loadAllMovies_should_return_an_empty_array_when_no_movies_exist_in_the_DB() async throws {
        mockActor.favoriteMovies = []

        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)
        try await store.loadAllMovies()

        XCTAssertEqual(store.movies.count, 0)
    }

    // MARK: - Add fav movies to DB

    func test_add_favorite_movie() async throws {
        let movie = FavoriteMovie(id: 1, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.addMovie(movie)

        XCTAssertEqual(store.movies.count, 1)
        XCTAssertEqual(store.movies.first?.id, 1)
        XCTAssertEqual(store.movies.first?.name, "Inception")

        try await store.addMovie(movie)
        XCTAssertEqual(store.movies.count, 1)
        XCTAssertEqual(store.movies.first?.name, "Inception")
    }

    // MARK: - Deleting movies from DB

    func test_deleting_single_favorite_movie() async throws {
        let movie = FavoriteMovie(id: 10, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.addMovie(movie)
        try await store.deleteMovie(with: movie.id)

        XCTAssertTrue(store.movies.isEmpty)
    }

    func test_deleting_single_favorite_movie__when_none_exists_in_the_DB() async throws {
        let movie = FavoriteMovie(id: 10, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.deleteMovie(with: movie.id)

        XCTAssertTrue(store.movies.isEmpty)
    }

    func test_deleting_multiple_favorite_movie() async throws {
        let inception = FavoriteMovie(id: 10, name: "Inception")
        let interstellar = FavoriteMovie(id: 11, name: "Interstellar")
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.addMovie(inception)
        try await store.addMovie(interstellar)
        try await store.deleteMovies(indexSet: IndexSet(integersIn: 0..<2))

        XCTAssertTrue(store.movies.isEmpty)
    }

    func test_deleting_multiple_favorite_movie_when_none_exists_in_the_DB() async throws {
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.deleteMovies(indexSet: IndexSet(integersIn: 0..<2))

        XCTAssertTrue(store.movies.isEmpty)
    }

    func test_deleting_favorite_movie_when_it_does_not_exist() async throws {
        let movie = FavoriteMovie(id: 999, name: "Inception")
        mockActor.shouldThrowError = true
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        await assertThrowsAsyncError(
            try await store.deleteMovie(with: movie.id)
        ) { error in
            XCTAssertEqual(error as? MoviesDBError, MoviesDBError.notFound)
        }
    }

    func test_fetching_favorite_movie_when_it_exists() async throws {
        let movie = FavoriteMovie(id: 11, name: "Blue is the Warmest Color")
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        try await store.addMovie(movie)
        let fetchedMovie = try await store.fetchMovie(with: movie.id)

        XCTAssertNotNil(fetchedMovie)
        XCTAssertEqual(fetchedMovie.id, 11)
        XCTAssertEqual(fetchedMovie.name, "Blue is the Warmest Color")
    }

    func test_fetching_favorite_movie_when_it_does_not_exist() async throws {
        let id = 999
        let store = FavoriteMoviesDBStore(movieDBModelStorage: mockActor)

        await assertThrowsAsyncError(
            try await store.fetchMovie(with: id)
        ) { error in
            XCTAssertEqual(error as? MoviesDBError, MoviesDBError.notFound)
        }
    }
}
