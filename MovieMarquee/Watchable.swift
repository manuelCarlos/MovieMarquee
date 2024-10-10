//
//  Watchable.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService
import Models

protocol Watchable: Sendable, Codable {
    var id: Int { get }
    var title: String { get }
    var voteAverage: Double? { get }
    var posterPath: String? { get }
    var backdropPath: String? { get }
    var overview: String? { get }
    var originalTitle: String? { get }
    var originalLanguage: OriginalLanguage? { get }
    var voteCount: Int? { get }
    var popularity: Double { get }
    var posterUrl: String { get }
}

extension Watchable {

    var posterUrl: String {
        APIConstants.defaultScheme +
        APIConstants.baseImgUrl +
        APIConstants.baseImgUrlPath +
        imagePath
    }

    var imagePath: String { return posterPath ?? backdropPath ?? "" }
}
