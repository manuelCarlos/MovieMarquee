//
//  LoadingStateViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 19.10.24.
//


import XCTest
import SnapshotTesting

@testable import PopularMoviesFeature


@available(iOS 14.0, *)
@MainActor
final class LoadingStateViewTests: XCTestCase {

    func test_loading_state_view() {
        let sut = LoadingStateView(subtitle: "Loading...")

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini),
            traits: .init(userInterfaceStyle: .light)
        ))

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini),
            traits: .init(userInterfaceStyle: .dark)
        ))
    }

    func test_loading_state_view_with_long_texts() {
        let title = "The Assassination of Jesse James By the Coward Robert Ford Final Final2 Cut Redux Part 44 Is a Loooong Title"
        let sut = LoadingStateView(subtitle: title)

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini),
            traits: .init(userInterfaceStyle: .light)
        ))

        assertSnapshot(of: sut, as: .image(
            layout: .device(config: .iPhone13Mini),
            traits: .init(userInterfaceStyle: .dark)
        ))
    }
}

