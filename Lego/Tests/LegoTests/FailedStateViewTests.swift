//
//  FailedStateViewTests.swift
//  LegoTests
//
//  Created by Manuel Lopes on 21.10.24.
//

import XCTest
import SnapshotTesting

@testable import Lego

@available(iOS 17.0, *)
@MainActor
final class FailedStateViewTests: XCTestCase {

    func test_failed_state_view_without_retry_button() {
        let sut = FailedStateView(title: "This is a very long test error text in case we need to test the layout",
                                  description: "This is a test description text that is even longer than the error text because we need to test the layout",
                                  onRetry: nil)

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
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }

    func test_failed_state_view_with_retry_button() {
        let sut = FailedStateView(title: "This is a test error text",
                                  description: "This is a test description text",
                                  onRetry: { })

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
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }
}
