//
//  APIConstants.swift
//  TMDBData
//
//  Created by Manuel Lopes on 05.10.24.
//

import Foundation

/// A type that holds constants related to The Movie Database (TMDb) API configuration.
/// This enum provides essential URLs, paths, and configuration values for building API requests.
public enum APIConstants {

    /// The base domain for TMDb API requests.
    public static let baseURL = "api.themoviedb.org"

    /// The base path for TMDb API endpoints.
    /// Example full URL: `https://api.themoviedb.org/3`
    public static let baseURLPath = "/3"

    /// The domain for TMDb authentication and web interactions.
    public static let authURL = "www.themoviedb.org"

    /// The scheme used for secure requests.
    public static let httpsScheme = "https"

    /// A default scheme for constructing full URLs.
    public static let defaultScheme = "https://"

    /// The base domain for TMDb image resources.
    public static let baseImgUrl = "image.tmdb.org"

    /// The path for TMDb image resources with a width of 500 pixels.
    /// Usage: Appended to `baseImgUrl` for constructing image URLs.
    public static let baseImgUrlPath = "/t/p/w500"

    /// The API key used for authenticating TMDb API requests.
    ///
    /// This key is loaded from an external source via the `loadAPIKey()` function.
    public static let apiKey = loadAPIKey()

    /// The default language setting for TMDb API requests.
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
