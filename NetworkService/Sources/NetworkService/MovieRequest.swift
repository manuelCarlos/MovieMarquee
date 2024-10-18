//
//  MovieRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import TMDBData

public enum MovieRequest: MediaTypeProtocol {

    case getPopularMovies(page: Int)
    case getMovieDetail(id: Int)
    case getCredits(id: Int)

    public var mediaType: MediaType {
        .movie
    }

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

    public var urlParams: [String: String?] {
        switch self {
        case .getPopularMovies(let page):
            return ["page": String(page),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getMovieDetail(id: let id):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "append_to_response": "credits"
            ]
        case .getCredits(id: let id):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        }
    }

    public var requestType: RequestType {
        .GET
    }
}
