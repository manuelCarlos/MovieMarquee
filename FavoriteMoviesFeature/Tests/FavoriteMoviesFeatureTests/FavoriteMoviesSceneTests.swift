//
//  FavoriteMoviesSceneTests.swift
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
final class FavoriteMoviesSceneTests: XCTestCase {

    func test_view_when_there_are_no_favorite_movies() {
        let sut = FavoriteMoviesScene(favoriteMoviesDBStore: FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor()))

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )
        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }

    func test_view_when_there_are_multiple_favorite_movies() async throws {
        let movieDBModelActor = MockMovieDBModelActor()
        movieDBModelActor.favoriteMovies = [
            FavoriteMovie(id: 1, name: "Stalker"),
            FavoriteMovie(id: 2, name: "Citizen Kane"),
            FavoriteMovie(id: 3, name: "The Godfather"),
            FavoriteMovie(id: 4, name: "The Dark Knight"),
            FavoriteMovie(id: 5, name: "The Shawshank Redemption"),
            FavoriteMovie(id: 6, name: "The Godfather: Part II"),
            FavoriteMovie(id: 7, name: "The Dark Knight Rises"),
            FavoriteMovie(id: 8, name: "The Lord of the Rings: The Return of the King"),
            FavoriteMovie(id: 9, name: "The Lord of the Rings: The Fellowship of the Ring")
        ]
        let storage = FavoriteMoviesDBStore(movieDBModelStorage: movieDBModelActor)
        try await storage.loadAllMovies()

        let sut = FavoriteMoviesScene(favoriteMoviesDBStore: storage, navigationTitle: "Favorite Movies List in General")

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )
        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }
}
