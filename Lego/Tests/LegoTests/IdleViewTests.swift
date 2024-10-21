//
//  IdleViewTests.swift
//  LegoTests
//
//  Created by Manuel Lopes on 21.10.24.
//

import XCTest
import SnapshotTesting

@testable import Lego

@available(iOS 15.0, *)
@MainActor
final class IdleViewTests: XCTestCase {

    func test_idle_view() {
        let sut = IdleView(task: {})

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
