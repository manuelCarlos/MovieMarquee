//
//  JsonLoader.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 12.10.24.
//

import XCTest

func loadJson<T: Decodable>(from fileName: String, withExtension fileExtension: String = "json", as type: T.Type) throws -> T {
    guard let path = Bundle.module.url(forResource: fileName, withExtension: fileExtension) else {
        XCTFail("Missing file: \(fileName).\(fileExtension)")
        throw NSError(domain: "MissingFileError", code: -1, userInfo: nil)
    }

    let jsonData = try Data(contentsOf: path)
    let decodedObject = try JSONDecoder().decode(T.self, from: jsonData)
    return decodedObject
}
