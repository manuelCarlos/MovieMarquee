//
//  Cast.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public struct Cast: Identifiable, Hashable, Creditable {
    public let id: Int
    public let adult: Bool
    public let gender: Int?
    public let knownForDepartment: Department?
    public let name: String?
    public let originalName: String?
    public let popularity: Double
    public let profilePath: String?
    public let castId: Int?
    public let character: String?
    public let creditId: String
    public let order: Int?
    public let department: Department?
    public let job: String?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let originalLanguage: OriginalLanguage?
    public let originalTitle, overview: String?
    public let posterPath: String?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
    public var dateOfRelease: Date? {
        guard let releaseDate else {
            return nil
        }
        return dateOfReleaseFormatter.date(from: releaseDate)
    }

    public var titleString: String? {
        return name ?? title ?? originalTitle ?? originalName
    }

    public var imagePath: String? {
        return posterPath ?? profilePath
    }

    public var role: String? {
        return character ?? job ?? department?.rawValue
    }

    private let releaseDate: String?

    // MARK: - Internal

    init(
        id: Int,
        adult: Bool,
        gender: Int? = nil,
        knownForDepartment: Department? = nil,
        name: String? = nil,
        originalName: String? = nil,
        popularity: Double,
        profilePath: String? = nil,
        castId: Int? = nil,
        character: String? = nil,
        creditId: String,
        order: Int? = nil,
        department: Department? = nil,
        job: String? = nil,
        backdropPath: String? = nil,
        genreIds: [Int]? = nil,
        originalLanguage: OriginalLanguage? = nil,
        originalTitle: String? = nil,
        overview: String? = nil,
        posterPath: String? = nil,
        title: String? = nil,
        video: Bool? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil,
        releaseDate: String? = nil) {
            self.id = id
            self.adult = adult
            self.gender = gender
            self.knownForDepartment = knownForDepartment
            self.name = name
            self.originalName = originalName
            self.popularity = popularity
            self.profilePath = profilePath
            self.castId = castId
            self.character = character
            self.creditId = creditId
            self.order = order
            self.department = department
            self.job = job
            self.backdropPath = backdropPath
            self.genreIds = genreIds
            self.originalLanguage = originalLanguage
            self.originalTitle = originalTitle
            self.overview = overview
            self.posterPath = posterPath
            self.title = title
            self.video = video
            self.voteAverage = voteAverage
            self.voteCount = voteCount
            self.releaseDate = releaseDate
        }
}
