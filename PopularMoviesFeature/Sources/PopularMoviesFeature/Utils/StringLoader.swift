//
//  StringLoader.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.12.24.
//

import Foundation

func loadJsonString(from fileName: String) throws -> String {
    guard let path = Bundle.module.path(forResource: fileName, ofType: nil) else {
        assertionFailure("Missing file: \(fileName)")
        throw NSError(domain: "MissingFileError", code: -1, userInfo: nil)
    }

    let jsonString = try String(contentsOfFile: path)
    return jsonString
}
