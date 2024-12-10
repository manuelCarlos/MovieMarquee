//
//  MovieDetailsViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 20.10.24.
//

import XCTest
import SnapshotTesting

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 15.0, *)
@MainActor
final class MovieDetailsViewTests: XCTestCase {

    private let movieService = MockMediaService()
    nonisolated(unsafe) var record: Bool?

    override func setUp() {
        super.setUp()

//        record = true
    }

    func test_movie_details_view_when_successfully_loaded() async throws {
        let controller = MockMovieDetailsController()
        controller.mockDetail = MovieDetails.make(id: 99, title: "Dr. Strange Love or why I stopped worrying and learned to love the bomb")
        let viewModel = MovieDetailsViewModel(controller: controller, navigationTitle: "details", movieId: 99)
        await viewModel.fetchMediaDetails()

        let sut = MovieDetailsView(viewModel: viewModel,
                                   movieService: movieService)

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )
    }

    func test_movie_details_view_when_loading_failed_due_to_no_internet() async throws {
        let controller = MockMovieDetailsController()
        controller.error = NSError(domain: "No internet connection", code: 999, userInfo: nil)
        let viewModel = MovieDetailsViewModel(controller: controller, navigationTitle: "details", movieId: 99)
        await viewModel.fetchMediaDetails()

        let sut = MovieDetailsView(viewModel: viewModel,
                                   movieService: movieService)

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini(.landscape)),
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )
    }
}
