//
//  MockWatchable.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import Foundation

@testable import Models
@testable import PopularMoviesFeature

struct MockWatchable: Watchable {
    var id: Int = 1
    var title: String = "Mock Title"
    var voteAverage: Double? = 7.0
    var posterPath: String? = "/mockPoster.jpg"
    var backdropPath: String? = "/mockBackdrop.jpg"
    var releaseDate: Date? = .distantPast
    var overview: String? = "Mock Overview"
    var originalTitle: String? = "Mock Original Title"
    var originalLanguage: OriginalLanguage? = .en
    var voteCount: Int? = 100
    var popularity: Double = 1.0
}
