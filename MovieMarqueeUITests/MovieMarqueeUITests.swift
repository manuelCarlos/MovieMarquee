//
//  MovieMarqueeUITests.swift
//  MovieMarqueeUITests
//
//  Created by Manuel Lopes on 04.10.24.
//

import XCTest

@MainActor
final class MovieMarqueeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_navigate_to_movie_details_screen_and_back_to_discover_screen() throws {
        let app = XCUIApplication()
        app.launch()

        app.scrollViews.otherElements.firstMatch.tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts.firstMatch.swipeUp()
        app.navigationBars.firstMatch.buttons["Discover"].tap()
    }

    func test_navigate_to_movie_details_via_the_full_list_of_popular_movies_and_back_to_discover_screen() throws {
        let app = XCUIApplication()
        app.launch()

        app.staticTexts["See All"].tap()

        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons.firstMatch.tap()
        app.navigationBars.firstMatch.buttons["All Popular Movies"].tap()

        app.navigationBars["All Popular Movies"].buttons["Discover"].tap()
    }
}
