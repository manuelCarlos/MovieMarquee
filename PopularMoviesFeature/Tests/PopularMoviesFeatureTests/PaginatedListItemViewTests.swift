//
//  PaginatedListItemViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 18.10.24.
//

import Foundation

import XCTest
import SnapshotTesting

@testable import Models
@testable import MoviesDB
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class PaginatedListItemViewTests: XCTestCase {

    private let dbStore = FavoriteMoviesDBStore(movieDBModelStorage: MockMovieDBModelActor())

    func test_media_list_item() {
        let sut = PaginatedListItemView(mediaItem: Movie.make(),
                               favoriteMoviesDBStore: dbStore)

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

    func test_media_list_item_with_long_texts() {
        let title = "The Assassination of Jesse James By the Coward Robert Ford Final Final2 Cut Redux Part 44 Is a Loooong Title"
        let sut = PaginatedListItemView(mediaItem: Movie.make(id: 1,
                                                     title: title),
                               favoriteMoviesDBStore: dbStore)

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
