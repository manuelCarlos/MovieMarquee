//
//  PopularMoviesFeatureViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 20.10.24.
//

import XCTest
import SnapshotTesting

@testable import Models
@testable import MoviesDB
@testable import MoviesDBMocks
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class PopularMoviesFeatureViewTests: XCTestCase {

    private let dbStore = FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor())

    func test_popular_movies_feature_view_when_successfully_loaded() async throws {
        let movies: [Movie] = [
            Movie.make(id: 1, title: "Blue is the warmest color"),
            Movie.make(id: 2, title: "City Lights"),
            Movie.make(id: 3, title: "The assassination of Jesse James by the Coward Robert Ford Final Cut Redux Part 2"),
            Movie.make(id: 4, title: "Taxi Driver"),
            Movie.make(id: 5, title: "Badlands"),
            Movie.make(id: 6, title: "The Tree of Life")
        ]
        let controller = MockMoviesOverviewController()
        controller.fetchNextPopularPageAsFullListStub = movies
        let viewModel = PopularMoviesFeatureViewModel(controller: controller)
        await viewModel.fetchMostPopularMovies()

        let sut = PopularMoviesFeatureView(viewModel: viewModel, favoriteMoviesDBStore: dbStore)

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

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }

    func test_popular_movies_feature_view_when_loading_failed_due_to_no_internet() async throws {
        let controller = MockMoviesOverviewController()
        controller.error = NSError(domain: "No internet connection", code: 999, userInfo: nil)
        let viewModel = PopularMoviesFeatureViewModel(controller: controller)
        await viewModel.fetchMostPopularMovies()

        let sut = PopularMoviesFeatureView(viewModel: viewModel, favoriteMoviesDBStore: dbStore)

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .light)
                       )
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }
}
