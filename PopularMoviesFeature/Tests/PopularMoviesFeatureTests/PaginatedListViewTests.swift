//
//  PaginatedListViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 18.10.24.
//

import Foundation

import XCTest
import SnapshotTesting

@testable import Models
@testable import MoviesDB
@testable import MoviesDBMocks
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class PaginatedListViewTests: XCTestCase {

    private let dbStore = FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor())
    private let movieService = MockMediaService()

    func test_media_list_successfully_loaded() async throws {
        let controller = MockMoviesOverviewController()
        controller.fetchNextPopularPageAsFullListStub = [
            Movie.make(id: 1, title: "Blue is the warmest color", originalLanguage: "fr", voteAverage: 10),
            Movie.make(id: 2, title: "City Lights", voteAverage: 3),
            Movie.make(id: 3, title: "The assassination of Jesse James by the Coward Robert Ford Final Cut Redux Part 2", voteAverage: 5)
        ]
        let viewModel = PaginatedListViewModel(controller: controller)
        await viewModel.fetchFirstPage()
        let sut = PaginatedListView(viewModel: viewModel,
                                    favoriteMoviesDBStore: dbStore,
                                    movieService: movieService)

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

    func test_empty_list_error_state_when_fetching_first_page() async throws {
        let controller = MockMoviesOverviewController()
        let viewModel = PaginatedListViewModel(controller: controller)
        await viewModel.fetchFirstPage()
        let sut = PaginatedListView(viewModel: viewModel,
                                    favoriteMoviesDBStore: dbStore,
                                    movieService: movieService)

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

    func test_no_internet_error_state_when_fetching_first_page() async throws {
        let controller = MockMoviesOverviewController()
        controller.error = NSError(domain: "No internet connection", code: 999, userInfo: nil)
        let viewModel = PaginatedListViewModel(controller: controller)
        await viewModel.fetchFirstPage()
        let sut = PaginatedListView(viewModel: viewModel,
                                    favoriteMoviesDBStore: dbStore,
                                    movieService: movieService)

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
