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
        releaseDate: Date? = Calendar.current.date(from: DateComponents(year: 1974, month: 10, day: 6)),
        title: String? = "Title",
        video: Bool? = false,
        voteAverage: Double? = 7.2,
        voteCount: Int? = 1000) -> Cast {
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
                releaseDate: releaseDate,
                title: title,
                video: video,
                voteAverage: voteAverage,
                voteCount: voteCount
            )
        }
}
