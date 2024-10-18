//
//  ArtistRequest.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

import TMDBData

enum ArtistRequest: NetworkRequest {

    case getPopularArtists(page: Int)
    case getArtist(id: Int)
    case getTVCredits(id: Int)
    case getMovieCredits(id: Int)
    case getImages(id: Int)

    var path: String {
        switch self {
        case .getPopularArtists:
            return "/person/popular"
        case  .getArtist(let id):
            return "/person/\(id)"
        case .getTVCredits(id: let id):
            return "/person/\(id)/tv_credits"
        case .getMovieCredits(id: let id):
            return "/person/\(id)/movie_credits"
        case .getImages(id: let id):
            return "/person/\(id)/images"
        }
    }

    var urlParams: [String: String?] {
        switch self {
        case .getPopularArtists(let page):
            return ["page": String(page),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getArtist(let id):
            return ["person_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getTVCredits(id: let id):
            return ["person_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getMovieCredits(id: let id):
            return ["person_id": String(id),
                    "api_key": APIConstants.apiKey,
                    "language": APIConstants.language
            ]
        case .getImages(id: let id):
            return ["person_id": String(id),
                    "api_key": APIConstants.apiKey
            ]
        }
    }

    var requestType: RequestType {
        .GET
    }
}
