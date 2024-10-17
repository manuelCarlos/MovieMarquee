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

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini)
        ))
    }

    func test_view_when_there_are_two_favorite_movies() async throws {
        let movieDBModelActor = MockMovieDBModelActor()
        movieDBModelActor.favoriteMovies = [.init(id: 1, name: "Movie 1"), .init(id: 2, name: "Movie 2")]
        let storage = FavoriteMoviesDBStore(movieDBModelStorage: movieDBModelActor)
        try await storage.loadAllMovies()

        let sut = FavoriteMoviesScene(favoriteMoviesDBStore: storage, navigationTitle: "Favorite Movies List in General")
        
        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini)
        ))
    }
}
