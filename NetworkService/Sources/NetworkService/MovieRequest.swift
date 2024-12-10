//
//  MovieRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import TMDBData

/// An enumeration encapsulating the details needed to construct and execute requests for various movie-related endpoints, such as fetching
/// popular movies, movie details, and credits.
///
/// Each case specifies the endpoint, request parameters, and HTTP method required for
/// making the respective API call.
public enum MovieRequest: RequestComponents {

    /// Fetches a list of popular movies from a given page.
    ///
    /// - Parameter page: The page number of results to fetch.
    case getPopularMovies(page: Int)

    /// Fetches detailed information about a specific movie.
    ///
    /// - Parameter id: The unique identifier of the movie.
    case getMovieDetail(id: Int)

    /// Fetches the cast and crew credits for a specific movie.
    ///
    /// - Parameter id: The unique identifier of the movie.
    case getCredits(id: Int)

    /// The API endpoint path for the request.
    ///
    /// - Returns: A string representing the path to the desired resource.
    public var path: String {
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
        case .getMovieDetail(id: let id):
            return "/movie/\(id)"
        case .getCredits(id: let id):
            return "/movie/\(id)/credits"
        }
    }

    /// The URL parameters required for the request.
    ///
    /// - Returns: A dictionary where keys are parameter names and values are their respective values.
    public var urlParams: [String: String?] {
        switch self {
        case .getPopularMovies(let page):
            return [
                "page": String(page),
                "api_key": APIConstants.apiKey,
                "language": APIConstants.language
            ]
        case .getMovieDetail(id: let id):
            return [
                "movie_id": String(id),
                "api_key": APIConstants.apiKey,
                "append_to_response": "credits"
            ]
        case .getCredits(id: let id):
            return [
                "movie_id": String(id),
                "api_key": APIConstants.apiKey,
                "language": APIConstants.language
            ]
        }
    }

    /// The HTTP request method used for the request.
    ///
    /// - Returns: The `RequestType` for this request. All cases in `MovieRequest` use `GET`.
    public var requestType: RequestType {
        .get
    }
}
