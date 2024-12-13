//
//  DepartmentTests.swift
//  Models
//
//  Created by Manuel Lopes on 13.12.24.
//
//
//  DepartmentTests.swift
//  Models
//
//  Created by Manuel Lopes on 13.12.24.
//

import XCTest
@testable import Models

final class DepartmentTests: XCTestCase {

    func test_department_localized_string() {
        let testCases: [Department: String] = [
            .acting: Texts.Department.acting,
            .art: Texts.Department.art,
            .camera: Texts.Department.camera,
            .costumeMakeUp: Texts.Department.costumeAndMakeup,
            .crew: Texts.Department.crew,
            .directing: Texts.Department.directing,
            .editing: Texts.Department.editing,
            .production: Texts.Department.production,
            .sound: Texts.Department.sound,
            .visualEffects: Texts.Department.visualEffects,
            .writing: Texts.Department.writing,
            .lighting: Texts.Department.lighting,
            .creator: Texts.Department.creator,
            .actor: Texts.Department.actor
        ]

        for testCase in testCases {
            XCTAssertEqual(testCase.key.localizedString, testCase.value, "Localized string for \(testCase.key) is incorrect.")
        }
    }
}
