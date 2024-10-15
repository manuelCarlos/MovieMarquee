//
//  ProductionCountryTests.swift
//  Models
//
//  Created by Manuel Lopes on 14.10.24.
//

import XCTest

@testable import Models

final class ProductionCountryTests: XCTestCase {

    func test_decoding_valid_json() throws {
        let json = """
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
        """

        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let productionCountry = try decoder.decode(ProductionCountry.self, from: jsonData)

        XCTAssertEqual(productionCountry.iso31661, "US")
        XCTAssertEqual(productionCountry.name, "United States of America")
    }

    func test_decoding_missing_iso_3166_1_attribute() throws {
        let json = """
        {
            "name": "United States of America"
        }
        """

        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        XCTAssertThrowsError(try decoder.decode(ProductionCountry.self, from: jsonData)) { error in
            guard case DecodingError.keyNotFound(let key, _) = error else {
                return XCTFail("Expected keyNotFound error but got: \(error)")
            }
            XCTAssertEqual(key.stringValue, "iso31661")
        }
    }

    func test_decoding_missing_name_attribute() throws {
        let json = """
        {
            "iso_3166_1": "US"
        }
        """
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        XCTAssertThrowsError(try decoder.decode(ProductionCountry.self, from: jsonData)) { error in
            guard case DecodingError.keyNotFound(let key, _) = error else {
                return XCTFail("Expected keyNotFound error but got: \(error)")
            }
            XCTAssertEqual(key.stringValue, "name")
        }
    }

    func test_decoding_missing_all_attributes() throws {
        let json = """
        {
        }
        """
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        XCTAssertThrowsError(try decoder.decode(ProductionCountry.self, from: jsonData)) { error in
            guard case DecodingError.keyNotFound = error else {
                return XCTFail("Expected keyNotFound error but got: \(error)")
            }
        }
    }

    func test_decoding_with_extra_attribute() throws {
        let json = """
        {
            "iso_3166_1": "US",
            "name": "United States of America",
            "extra_field": "unexpected value"
        }
        """

        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let productionCountry = try decoder.decode(ProductionCountry.self, from: jsonData)

        XCTAssertEqual(productionCountry.iso31661, "US")
        XCTAssertEqual(productionCountry.name, "United States of America")
    }
}
