//
//  LoadingStateViewTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 19.10.24.
//

import XCTest
import SnapshotTesting

@testable import Lego

@available(iOS 14.0, *)
@MainActor
final class LoadingStateViewTests: XCTestCase {

    func test_loading_state_view() {
        let sut = LoadingStateView(subtitle: "Loading...")

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
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

    func test_loading_state_view_with_long_texts() {
        let title = "This a very long loading state title that should wrap to multiple lines. Likely in German 😛"
        let sut = LoadingStateView(subtitle: title)

        assertSnapshot(of: sut,
                       as: .image(
                        layout: .device(config: .iPhone13Mini),
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
