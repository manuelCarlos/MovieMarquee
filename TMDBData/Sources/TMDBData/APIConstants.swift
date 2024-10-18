//
//  APIConstants.swift
//  TMDBData
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

public enum APIConstants {
    public static let baseURL = "api.themoviedb.org"
    public static let baseURLPath = "/3"

    public static let authURL = "www.themoviedb.org"
    public static let authURLPath = ""

    public static let httpsScheme = "https"
    public static let defaultScheme = "https://"

    public static let baseImgUrl = "image.tmdb.org"
    public static let baseImgUrlPath = "/t/p/w500"

    public static let apiKey = loadAPIKey()
    public static let language = "en-US"

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
