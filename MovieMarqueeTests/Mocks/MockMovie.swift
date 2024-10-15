//
//  MockMovie.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 10.10.24.
//
import Foundation

@testable import Models

extension Movie {
    static func make(id: Int,
                     title: String = "Airplane",
                     adult: Bool = false,
                     posterPath: String = "posterPath",
                     backdropPath: String = "backdropPath",
                     overview: String = "Good movie",
                     releaseDate: Date = .distantPast,
                     genreIds: [Int] = [],
                     originalTitle: String = "Original Title",
                     originalLanguage: OriginalLanguage = .en,
                     popularity: Double = 10,
                     voteCount: Int = 8,
                     video: Bool = false,
                     voteAverage: Double = 10000) -> Movie {
        return Movie(id: id,
                     title: title,
                     adult: true,
                     posterPath: posterPath,
                     backdropPath: backdropPath,
                     overview: "Good movie",
                     releaseDate: releaseDate,
                     genreIds: genreIds,
                     originalTitle: originalTitle,
                     originalLanguage: originalLanguage,
                     popularity: popularity,
                     voteCount: voteCount,
                     video: video,
                     voteAverage: voteAverage)
    }
}
