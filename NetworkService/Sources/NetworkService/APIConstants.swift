//
//  APIConstants.swift
//  NetworkService
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

enum APIConstants {
    static let baseURL = "api.themoviedb.org"
    static let baseURLPath = "/3"

    static let authURL = "www.themoviedb.org"
    static let authURLPath = ""

    static let defaultScheme = "https://"

    static let baseImgUrl = "image.tmdb.org"
    static let baseImgUrlPath = "/t/p/w500"

    static let apiKey = loadAPIKey()
    static let language = "en-US"

    static func loadAPIKey(from bundle: Bundle = .module, jsonFileName: String = "apiKey") -> String? {
        guard let path = bundle.url(forResource: jsonFileName, withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: path)
            if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
                if let apiKey = jsonResult["apiKey"] as? String {
                    return apiKey
                }
            }
        } catch {
            assertionFailure("Error loading API key: \(error)")
        }

        return nil
    }
}
