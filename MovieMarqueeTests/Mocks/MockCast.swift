//
//  MockCast.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 14.10.24.
//

import Foundation

@testable import Models

extension Cast {

    static func make(adult: Bool = false,
                     gender: Int? = 1,
                     id: Int = 12345,
                     knownForDepartment: Department? = .acting,
                     name: String? = "John Doe",
                     originalName: String? = "Johnathan Doe",
                     popularity: Double = 10.5,
                     profilePath: String? = "/profilePath.jpg",
                     castID: Int? = 1,
                     character: String? = "Main Character",
                     creditID: String = "abc123",
                     order: Int? = 1,
                     department: Department? = .acting,
                     job: String? = "Actor",
                     backdropPath: String? = "/backdropPath.jpg",
                     genreIDS: [Int]? = [28, 12],
                     originalLanguage: OriginalLanguage? = .en,
                     originalTitle: String? = "Mock Original Title",
                     overview: String? = "This is a mock overview of the movie or TV show.",
                     posterPath: String? = "/posterPath.jpg",
                     releaseDate: Date? = Date(),
                     title: String? = "Mock Title",
                     video: Bool? = false,
                     voteAverage: Double? = 8.5,
                     voteCount: Int? = 1000) -> Cast {
        return Cast(adult: adult,
                    gender: gender,
                    id: id,
                    knownForDepartment: knownForDepartment,
                    name: name,
                    originalName: originalName,
                    popularity: popularity,
                    profilePath: profilePath,
                    castID: castID,
                    character: character,
                    creditID: creditID,
                    order: order,
                    department: department,
                    job: job,
                    backdropPath: backdropPath,
                    genreIDS: genreIDS,
                    originalLanguage: originalLanguage,
                    originalTitle: originalTitle,
                    overview: overview,
                    posterPath: posterPath,
                    releaseDate: releaseDate,
                    title: title,
                    video: video,
                    voteAverage: voteAverage,
                    voteCount: voteCount)
    }
}
