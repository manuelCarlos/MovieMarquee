//
//  MockMovieDetail.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

@testable import Models

@available(iOS 16.0, *)
extension MovieDetails {
    static func make(id: Int = 12,
                     adult: Bool = false,
                     overview: String = "A cookie monster is a fictional creature that appears in various media, including animated films, video games, and comic books.",
                     releaseDate: Date = Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 24))!,
                     genres: [Genre] = [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Comedy")],
                     budget: Int = 1000,
                     originalLanguage: OriginalLanguage = .en,
                     popularity: Double = 4.4,
                     revenue: Int = 2000,
                     runtime: Int? = 126,
                     status: String = "ok",
                     title: String = "The cookie monster",
                     video: Bool = false,
                     voteAverage: Double? = 9) -> MovieDetails {
        return MovieDetails(id: id,
                           adult: adult,
                           overview: overview,
                           releaseDate: releaseDate,
                           genres: genres,
                           budget: budget,
                           originalLanguage: originalLanguage,
                           popularity: popularity,
                           revenue: revenue,
                           runtime: runtime,
                           status: status,
                           title: title,
                           video: video,
                           voteAverage: voteAverage)
    }
}
