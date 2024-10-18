//
//  MoviePosterViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 18.10.24.
//

import XCTest
import SnapshotTesting

@testable import PopularMoviesFeature

@available(iOS 15.0, *)
@MainActor
final class MoviePosterViewTests: XCTestCase {

    func test_movie_poster_view() {
        let sut = MoviePosterView(imageUrl: "")

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini),
            traits: .init(userInterfaceStyle: .light)
        ))
    }
}
