//
//  MockMovieDetail.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

@testable import Models

@available(iOS 16.0, *)
extension MovieDetail {
    static func make(id: Int = 12,
                     adult: Bool = false,
                     releaseDate: Date = .distantPast,
                     genres: [Genre] = [],
                     budget: Int = 1000,
                     popularity: Double = 4.4,
                     revenue: Int = 2000,
                     status: String = "ok",
                     title: String = "The cookie monster",
                     video: Bool = false) -> MovieDetail {
        return MovieDetail(id: id,
                           adult: adult,
                           releaseDate: releaseDate,
                           genres: genres,
                           budget: budget,
                           popularity: popularity,
                           revenue: revenue,
                           status: status,
                           title: title,
                           video: video)
    }
}
