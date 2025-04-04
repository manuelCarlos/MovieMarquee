//
//  ArtistItemViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 21.10.24.
//

import XCTest
import SnapshotTesting

@testable import Models
@testable import PopularMoviesFeature

@available(iOS 17.0, *)
@MainActor
final class ArtistItemViewTests: XCTestCase {

    nonisolated(unsafe) var record: Bool?

    override func setUp() {
        super.setUp()

//        record = true
    }

    func test_artist_view_when_avatar_image_is_loading() async throws {
        let sut = ArtistItemView(artist: Cast.make(id: 1, name: "Madonna"))

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .sizeThatFits,
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .sizeThatFits,
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )
    }

    func test_artist_view_when_avatar_image_fails_to_load() async throws {
        let sut = ArtistItemView(artist: Cast.make(id: 1,
                                                   name: "Daniel Michael Blake Day-Lewis",
                                                   profilePath: nil,
                                                   posterPath: nil))

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .sizeThatFits,
                        traits: .init(userInterfaceStyle: .light)
                       ),
                       record: record
        )

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .sizeThatFits,
                        traits: .init(userInterfaceStyle: .dark)
                       ),
                       record: record
        )
    }
}
