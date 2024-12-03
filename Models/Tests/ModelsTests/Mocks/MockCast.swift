//
//  MockCast.swift
//  ModelsTests
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

@testable import Models

extension Cast {

    static func makeCast(
        adult: Bool = true,
        gender: Int? = 1,
        id: Int = 1,
        knownForDepartment: Department = .acting,
        name: String? = "Name",
        originalName: String? = "Original Name",
        popularity: Double = 10,
        profilePath: String? = "ProfilePath",
        castId: Int? = 12,
        character: String? = "Character",
        creditId: String = "CreditID",
        order: Int? = 1,
        department: Department = .acting,
        job: String? = "Job",
        backdropPath: String? = "BackdropPath",
        genreIds: [Int]? = [1, 2, 3],
        originalLanguage: OriginalLanguage? = .en,
        originalTitle: String? = "Original Title",
        overview: String? = "Overview",
        posterPath: String? = "PostPath",
        title: String? = "Title",
        video: Bool? = false,
        voteAverage: Double? = 7.2,
        voteCount: Int? = 1000,
        releaseDate: String? = "1974-10-06") -> Cast {
            return Cast(
                adult: adult,
                gender: gender,
                id: id,
                knownForDepartment: knownForDepartment,
                name: name,
                originalName: originalName,
                popularity: popularity,
                profilePath: profilePath,
                castId: castId,
                character: character,
                creditId: creditId,
                order: order,
                department: department,
                job: job,
                backdropPath: backdropPath,
                genreIds: genreIds,
                originalLanguage: originalLanguage,
                originalTitle: originalTitle,
                overview: overview,
                posterPath: posterPath,
                title: title,
                video: video,
                voteAverage: voteAverage,
                voteCount: voteCount,
                releaseDate: releaseDate
            )
        }
}
