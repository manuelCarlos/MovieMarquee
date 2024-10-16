//
//  MovieDBModelActorTests.swift
//  MoviesDB
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
        // In-memory ModelContainer setup for testing
        let schema = Schema([FavoriteMovieModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

        modelActor = MovieDBModelActor(modelContainer: modelContainer)
    }

    override func tearDownWithError() throws {
        modelActor = nil
    }

    func test_add_favorite_movie() async throws {
        let favoriteMovie = FavoriteMovie(id: 1, name: "Inception")

        try await modelActor.addFavoriteMovie(favoriteMovie)

        let fetchedMovie = await modelActor.fetchFavoriteMovie(id: favoriteMovie.id)
        XCTAssertEqual(fetchedMovie?.id, favoriteMovie.id)
        XCTAssertEqual(fetchedMovie?.name, favoriteMovie.name)
    }

    func test_fetch_favorite_movies() async throws {
        let favoriteMovies = [
            FavoriteMovie(id: 1, name: "Inception"),
            FavoriteMovie(id: 2, name: "Interstellar")
        ]

        for movie in favoriteMovies {
            try await modelActor.addFavoriteMovie(movie)
        }

        let fetchedMovies = try await modelActor.fetchFavoriteMovies()

        XCTAssertEqual(fetchedMovies.count, favoriteMovies.count)
        XCTAssertTrue(fetchedMovies.contains { $0.id == favoriteMovies[0].id && $0.name == favoriteMovies[0].name })
        XCTAssertTrue(fetchedMovies.contains { $0.id == favoriteMovies[1].id && $0.name == favoriteMovies[1].name })
    }

    func test_delete_favorite_movie() async throws {
        let favoriteMovie = FavoriteMovie(id: 1, name: "Inception")
        try await modelActor.addFavoriteMovie(favoriteMovie)

        let fetchedMovie = await modelActor.fetchFavoriteMovie(id: favoriteMovie.id)
        XCTAssertEqual(fetchedMovie?.id, favoriteMovie.id)

        try await modelActor.deleteFavoriteMovie(with: favoriteMovie.id)

        let noMovie = await modelActor.fetchFavoriteMovie(id: favoriteMovie.id)
        XCTAssertNil(noMovie)
    }

    func test_get_favorite_movie_not_found() async throws {
        let nonExistentId = 999

        let movie = await modelActor.fetchFavoriteMovie(id: nonExistentId)

        XCTAssertNil(movie)
    }
}
