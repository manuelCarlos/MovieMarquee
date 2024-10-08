//
//  MovieRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

enum MovieRequest: MediaTypeProtocol {

    case getPopularMovies(page: Int)
    case getUpcomingMovies(page: Int)
    case getNowPlayingMovies(page: Int)
    case getMovieDetail(id: Int)
    case getMovieReviews(id: Int, page: Int)
    case getSimilarMoviesTo(id: Int, page: Int)
    case getCredits(id: Int)

    var mediaType: MediaType {
        .movie
    }

    var path: String {
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
        case .getUpcomingMovies:
            return "/movie/upcoming"
        case .getNowPlayingMovies:
            return "/movie/now_playing"
        case .getMovieDetail(id: let id):
            return "/movie/\(id)"
        case .getMovieReviews(let id, _):
            return "/movie/\(id)/reviews"
        case .getSimilarMoviesTo(let id, _):
            return "/movie/\(id)/similar"
        case .getCredits(id: let id):
            return "/movie/\(id)/credits"
        }
    }

    var urlParams: [String: String?] {
        switch self {
        case .getPopularMovies(let page):
            return ["page": String(page),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getUpcomingMovies(let page):
            return ["page": String(page),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getNowPlayingMovies(let page):
            return ["page": String(page),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getMovieDetail(id: let id):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "append_to_response": "credits"
            ]
        case .getMovieReviews(let id, let page):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language,
                    "page": String(page)
            ]
        case .getSimilarMoviesTo(let id, let page):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language,
                    "page": String(page)
            ]
        case .getCredits(id: let id):
            return ["movie_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        }
    }

    var requestType: RequestType {
        .GET
    }
}
