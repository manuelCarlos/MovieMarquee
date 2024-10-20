//
//  Cast.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public struct Cast: Identifiable, Hashable, Creditable {

    public let adult: Bool
    public let gender: Int?
    public let id: Int
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
    public let releaseDate: Date?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    public var titleString: String? {
        return title ?? originalTitle ?? originalName
    }

    public var imagePath: String? {
        return posterPath ?? profilePath
    }

    public var role: String? {
        return character ?? job ?? department?.rawValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decode(Bool.self, forKey: .adult)
        gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        id = try container.decode(Int.self, forKey: .id)
        knownForDepartment = try container.decodeIfPresent(Department.self, forKey: .knownForDepartment)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        popularity = try container.decode(Double.self, forKey: .popularity)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
        castId = try container.decodeIfPresent(Int.self, forKey: .castId)
        character = try container.decodeIfPresent(String.self, forKey: .character)
        creditId = try container.decode(String.self, forKey: .creditId)
        order = try container.decodeIfPresent(Int.self, forKey: .order)
        department = try container.decodeIfPresent(Department.self, forKey: .department)
        job = try container.decodeIfPresent(String.self, forKey: .job)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        originalLanguage = try container.decodeIfPresent(OriginalLanguage.self, forKey: .originalLanguage)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        video = try container.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        let release = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        let formatter = DateFormatter.yyyyMMdd
        releaseDate = formatter.date(from: release)
    }

    // MARK: - Internal

    init(
        adult: Bool,
        gender: Int? = nil,
        id: Int,
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
        releaseDate: Date? = nil,
        title: String? = nil,
        video: Bool? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil) {
            self.adult = adult
            self.gender = gender
            self.id = id
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
            self.releaseDate = releaseDate
            self.title = title
            self.video = video
            self.voteAverage = voteAverage
            self.voteCount = voteCount
        }
}
