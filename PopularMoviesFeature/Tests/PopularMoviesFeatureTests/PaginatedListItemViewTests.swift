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
@testable import PopularMoviesFeature

@available(iOS 15.0, *)
@MainActor
final class PaginatedListItemViewTests: XCTestCase {

    private let movieService = MockMediaService()
    nonisolated(unsafe) var record: Bool?

    override func setUp() {
        super.setUp()

//        record = true
    }

    func test_media_list_item() {
        let sut = PaginatedListItemView(mediaItem: Movie.make(),
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
    }

    func test_media_list_item_with_long_texts() {
        let title = "The Assassination of Jesse James By the Coward Robert Ford Final Final2 Cut Redux Part 44 Is a Loooong Title"
        let sut = PaginatedListItemView(mediaItem: Movie.make(id: 1, title: title),
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
    }
}
