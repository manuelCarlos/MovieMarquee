//
//  IconsTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 22.10.24.
//

import XCTest
import SwiftUI

@testable import PopularMoviesFeature

@available(iOS 13.0, *)
final class IconsTests: XCTestCase {

    func test_favorite_icon_is_on_returns_heart_fill() {
        let isOn = true
        let image = Icons.favorite(isOn: isOn)

        XCTAssertEqual(image, Image(systemName: "heart.fill"))
    }

    func test_favorite_icon_is_off_returns_heart() {
        let isOn = false
        let image = Icons.favorite(isOn: isOn)

        XCTAssertEqual(image, Image(systemName: "heart"))
    }

    func test_disclosure_indicator_returns_chevron_right() {
        let image = Icons.disclosureIndicator

        XCTAssertEqual(image, Image(systemName: "chevron.right"))
    }
}
