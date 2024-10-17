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

    func test_loadAllMovies_successfuly() async throws {
        mockActor.favoriteMovies = [FavoriteMovie(id: 1, name: "Test Movie")]

        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)
        try await store.loadAllMovies()

        XCTAssertEqual(store.movies.count, 1)
        XCTAssertEqual(store.movies.first?.name, "Test Movie")
    }

    func test_loadAllMovies_should_return_an_empty_array_when_no_movies_exist_in_the_DB() async throws {
        mockActor.favoriteMovies = []

        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)
        try await store.loadAllMovies()

        XCTAssertEqual(store.movies.count, 0)
    }

    func test_add_favorite_movie() async throws {
        let movie = FavoriteMovie(id: 1, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)

        try await store.addMovie(movie)

        XCTAssertEqual(store.movies.count, 1)
        XCTAssertEqual(store.movies.first?.id, movie.id)
        XCTAssertEqual(store.movies.first?.name, movie.name)

        try await store.addMovie(movie)
        XCTAssertEqual(store.movies.count, 1)
    }

    func test_deleting_favorite_movie() async throws {
        let movie = FavoriteMovie(id: 1, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)

        try await store.addMovie(movie)
        try await store.deleteMovie(with: movie.id)

        XCTAssertTrue(store.movies.isEmpty)
    }

    func test_deleting_favorite_movie_when_it_does_not_exist() async throws {
        let movie = FavoriteMovie(id: 999, name: "Inception")
        mockActor.shouldThrowError = true
        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)

        var didFailWithError: Error?
        do {
            // This call is expected to fail
            _ =  try await store.deleteMovie(with: movie.id)
        } catch {
            didFailWithError = error
            // Here you could do more assertions with the non-nil error object
        }

        XCTAssertNotNil(didFailWithError)
    }

    func test_fetching_favorite_movie_when_it_exists() async throws {
        let movie = FavoriteMovie(id: 1, name: "Inception")
        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)

        try await store.addMovie(movie)
        let fetchedMovie = try await store.fetchMovie(with: movie.id)

        XCTAssertNotNil(fetchedMovie)
        XCTAssertEqual(fetchedMovie?.id, movie.id)
        XCTAssertEqual(fetchedMovie?.name, movie.name)
    }

    func test_fetching_favorite_movie_when_it_does_not_exist() async throws {
        let store = FavoriteMoviesDBStore(movieDBModelActor: mockActor)
        let fetchedMovie = try await store.fetchMovie(with: 999)

        XCTAssertNil(fetchedMovie)
    }
}
