//
//  MediaSectionTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 15.10.24.
//

import XCTest

@testable import PopularMoviesFeature

final class MediaSectionTests: XCTestCase {

    func test_media_section_popular_movies_type_is_movie() {
        let section = MediaSection.popularMovies
        XCTAssertEqual(section.type, .movie)
    }

    func test_media_section_case_iterable_contains_popular_movies() {
        let allCases = MediaSection.allCases

        XCTAssertEqual(allCases.count, 1)
        XCTAssertTrue(allCases.contains(.popularMovies))
    }
}
