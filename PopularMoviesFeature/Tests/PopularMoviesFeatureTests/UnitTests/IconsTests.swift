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

    func test_favorite_is_on_returns_heart_fill_icon() {
        let isOn = true
        let image = Icons.favorite(isOn: isOn)

        XCTAssertEqual(image, Image(systemName: "heart.fill"))
    }

    func test_favorite_is_off_returns_heart_icon() {
        let isOn = false
        let image = Icons.favorite(isOn: isOn)

        XCTAssertEqual(image, Image(systemName: "heart"))
    }

    func test_disclosure_indicator_returns_chevron_right_icon() {
        let image = Icons.disclosureIndicator

        XCTAssertEqual(image, Image(systemName: "chevron.right"))
    }

    func test_movie_poster_failure_state_icon() {
        let image = Icons.moviePosterFailure

        XCTAssertEqual(image, Image(systemName: "photo.badge.exclamationmark"))
    }

    func test_artist_item_failure_state_icon() {
        let image = Icons.artistItemFailure

        XCTAssertEqual(image, Image(systemName: "person.fill"))
    }
}
