//
//  MovieMarqueeUITests.swift
//  MovieMarqueeUITests
//
//  Created by Manuel Lopes on 04.10.24.
//

import XCTest

final class MovieMarqueeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func test_navigate_to_movie_details_screen_and_back_to_discover_screen() throws {
        let app = XCUIApplication()
        app.launch()

        app.scrollViews.otherElements.firstMatch.tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts.firstMatch.swipeUp()
        app.navigationBars.firstMatch.buttons["Discover"].tap()
    }
}
