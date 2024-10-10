//
//  MockWatchable.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import Models
@testable import MovieMarquee

struct MockWatchable: Watchable {
    var id: Int = 1
    var title: String = "Mock Title"
    var voteAverage: Double? = 7.0
    var posterPath: String? = "/mockPoster.jpg"
    var backdropPath: String? = "/mockBackdrop.jpg"
    var overview: String? = "Mock Overview"
    var originalTitle: String? = "Mock Original Title"
    var originalLanguage: OriginalLanguage? = .en
    var voteCount: Int? = 100
    var popularity: Double = 1.0
}
