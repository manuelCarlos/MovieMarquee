//
//  MovieCastGridTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 21.10.24.
//

import XCTest
import SnapshotTesting

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class MovieCastGridTests: XCTestCase {

    nonisolated(unsafe) var record: Bool?

    override func setUp() {
        super.setUp()

//        record = true
    }

    func test_movie_cast_grid_when_avatars_are_loading() async throws {
        let controller = MockMoviesCastController()
        controller.mockCasts = [
            Cast.make(id: 1, name: "Philip Seymour Hoffman"),
            Cast.make(id: 2, name: "John Travolta"),
            Cast.make(id: 3, name: "Cary Elwes"),
            Cast.make(id: 4, name: "Dustin Hoffman"),
            Cast.make(id: 5, name: "Paul Giovannini"),
            Cast.make(id: 6, name: "Paul Newman"),
            Cast.make(id: 7, name: "Robert De Niro")
        ]
        let viewModel = MovieCastViewModel(controller: controller, mediaId: 99)
        await viewModel.fetchMediaCast()

        let sut = MovieCastGrid(viewModel: viewModel)

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
