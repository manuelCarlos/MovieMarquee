//
//  Watchable.swift
//  Models
//
//  Created by Manuel Lopes on 18.10.24.
//

import TMDBData

@available(iOS 13.0, *)
public protocol Watchable: Codable, Sendable {
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

@available(iOS 13.0, *)
public extension Watchable {

    var posterUrl: String {
        APIConstants.defaultScheme +
        APIConstants.baseImgUrl +
        APIConstants.baseImgUrlPath +
        imagePath
    }

    var imagePath: String { return posterPath ?? backdropPath ?? "" }
}
