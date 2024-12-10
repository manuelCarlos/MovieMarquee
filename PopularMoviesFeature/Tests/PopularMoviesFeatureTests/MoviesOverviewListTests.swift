//
//  MoviesOverviewListTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 20.10.24.
//

import Foundation

import XCTest
import SnapshotTesting

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 15.0, *)
@MainActor
final class MoviesOverviewListTests: XCTestCase {

    private let movieService = MockMediaService()
    nonisolated(unsafe) var record: Bool?

    override func setUp() {
        super.setUp()

//        record = true
    }

    func test_movie_overview_list() async throws {
        let movies: [Movie] = [
            Movie.make(id: 1, title: "Blue is the warmest color"),
            Movie.make(id: 2, title: "City Lights"),
            Movie.make(id: 3, title: "The assassination of Jesse James by the Coward Robert Ford Final Cut Redux Part 2"),
            Movie.make(id: 4, title: "Taxi Driver"),
            Movie.make(id: 5, title: "Badlands"),
            Movie.make(id: 6, title: "The Tree of Life")
        ]

        let sut = MoviesOverviewList(
            navigationTitle: "Discover",
            title: "Popular Movies",
            movies: movies,
            movieService: movieService
        )

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
