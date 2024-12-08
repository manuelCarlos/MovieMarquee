//
//  MovieOverviewListItemTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 20.10.24.
//

import Foundation

import XCTest
import SnapshotTesting

@testable import Models
@testable import MoviesDB
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class MovieOverviewListItemTests: XCTestCase {

    private let dbStore = FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor())
    private let movieService = MockMediaService()


    func test_movie_overview_list_item_with_short_title() async throws {
        let movie = Movie.make(id: 1, title: "Stalker")

        let sut = MovieOverviewListItem(movie: movie,
                                        favoriteMoviesDBStore: dbStore,
                                        movieService: movieService)
        assertSnapshot(of: sut,
                       as: .image(
                        layout: .fixed(width: 150, height: 300),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .fixed(width: 120, height: 250),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }

    func test_movie_overview_list_item_with_long_title() async throws {
        let movie =  Movie.make(id: 1, title: "The Assassination of Jesse James By the Coward Robert Ford")

        let sut = MovieOverviewListItem(movie: movie,
                                        favoriteMoviesDBStore: dbStore,
                                        movieService: movieService)
        assertSnapshot(of: sut,
                       as: .image(
                        layout: .fixed(width: 150, height: 300),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .fixed(width: 120, height: 250),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }
}
