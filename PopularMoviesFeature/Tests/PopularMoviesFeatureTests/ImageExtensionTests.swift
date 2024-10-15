//
//  ImageExtensionTests.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 15.10.24.
//

import XCTest
import SwiftUI

@testable import PopularMoviesFeature

final class ImageExtensionTests: XCTestCase {

    private lazy var mockBundle = Bundle(for: type(of: self))

    func test_image_initialization_with_existing_image() {
        let image = Image(resource: "testImage", ofType: "jpg", in: mockBundle)

        XCTAssertNotNil(image, "Image should not be nil for a valid image resource.")
    }

    func test_image_initialization_with_non_existing_image() {
        let image = Image(resource: "nonExistentImage", ofType: "png", in: mockBundle)

        XCTAssertNotNil(image)
    }
}
