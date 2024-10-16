//
//  MediaSection.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

enum MediaSection: Sendable, CaseIterable {
    case popularMovies

    var type: MediaType {
        switch self {
        case .popularMovies:
            return .movie
        }
    }
}