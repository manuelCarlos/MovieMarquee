//
//  StarsViewTests.swift
//  Lego
//
//  Created by Manuel Lopes on 28.11.24.
//

import XCTest
import SnapshotTesting

@testable import Lego

@MainActor
final class StarsViewTests: XCTestCase {

    func test_stars_rating() {
        checkStarsViewSnapshot(for: 0, maxRating: 5)
        checkStarsViewSnapshot(for: 1, maxRating: 5)
        checkStarsViewSnapshot(for: 2, maxRating: 5)
        checkStarsViewSnapshot(for: 3, maxRating: 5)
        checkStarsViewSnapshot(for: 4, maxRating: 5)
        checkStarsViewSnapshot(for: 5, maxRating: 5)

        checkStarsViewSnapshot(for: 0.5, maxRating: 5)
        checkStarsViewSnapshot(for: 1.4, maxRating: 5)
        checkStarsViewSnapshot(for: 2.6, maxRating: 5)
        checkStarsViewSnapshot(for: 3.7, maxRating: 5)
        checkStarsViewSnapshot(for: 4.2, maxRating: 5)
        checkStarsViewSnapshot(for: 4.9, maxRating: 5)
    }

    func test_stars_view_init_should_fail_with_bad_ratings() {
        XCTAssertNil(StarsView(rating: 0, maxRating: 0))
        XCTAssertNil(StarsView(rating: 2, maxRating: 0))
        XCTAssertNil(StarsView(rating: -2, maxRating: 3))
        XCTAssertNil(StarsView(rating: -2, maxRating: 1))
        XCTAssertNil(StarsView(rating: .nan, maxRating: 4))
        XCTAssertNil(StarsView(rating: 10, maxRating: 4))
        XCTAssertNil(StarsView(rating: 10, maxRating: 4))
    }

    // MARK: - Private

    private func checkStarsViewSnapshot(for rating: CGFloat,
                                        maxRating: Int,
                                        layout: SwiftUISnapshotLayout = .fixed(width: 100, height: 50)) {
        let sut = StarsView(rating: rating, maxRating: maxRating)

        assertSnapshot(of: sut,
                       as: .image(
                        layout: layout,
                        traits: .init(userInterfaceStyle: .light)
                       )
        )
        assertSnapshot(of: sut,
                       as: .image(
                        layout: layout,
                        traits: .init(userInterfaceStyle: .dark)
                       )
        )
    }
}
