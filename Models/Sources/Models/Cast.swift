//
//  Cast.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public typealias Crew = Cast

public struct Cast: Codable, Identifiable, Hashable, Sendable {

    init(
        adult: Bool,
        gender: Int? = nil,
        id: Int,
        knownForDepartment: Department? = nil,
        name: String? = nil,
        originalName: String? = nil,
        popularity: Double,
        profilePath: String? = nil,
        castID: Int? = nil,
        character: String? = nil,
        creditID: String,
        order: Int? = nil,
        department: Department? = nil,
        job: String? = nil,
        backdropPath: String? = nil,
        genreIDS: [Int]? = nil,
        originalLanguage: OriginalLanguage? = nil,
        originalTitle: String? = nil,
        overview: String? = nil,
        posterPath: String? = nil,
        releaseDate: Date? = nil,
        title: String? = nil,
        video: Bool? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil
    ) {
        self.adult = adult
        self.gender = gender
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.castID = castID
        self.character = character
        self.creditID = creditID
        self.order = order
        self.department = department
        self.job = job
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
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
        castID = try container.decodeIfPresent(Int.self, forKey: .castID)
        character = try container.decodeIfPresent(String.self, forKey: .character)
        creditID = try container.decode(String.self, forKey: .creditID)
        order = try container.decodeIfPresent(Int.self, forKey: .order)
        department = try container.decodeIfPresent(Department.self, forKey: .department)
        job = try container.decodeIfPresent(String.self, forKey: .job)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS)
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

    public let adult: Bool
    public let gender: Int?
    public let id: Int
    public let knownForDepartment: Department?
    public let name: String?
    public let originalName: String?
    public let popularity: Double
    public let profilePath: String?
    public let castID: Int?
    public let character: String?
    public let creditID: String
    public let order: Int?
    public let department: Department?
    public let job: String?
    public let backdropPath: String?
    public let genreIDS: [Int]?
    public let originalLanguage: OriginalLanguage?
    public let originalTitle, overview: String?
    public let posterPath: String?
    public let releaseDate: Date?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    var getKnownForDepartment: String? {
        knownForDepartment?.rawValue
    }

    var getTitle: String {
        return title ?? originalTitle ?? originalName ?? ""
    }

    var getImagePath: String {
        return posterPath ?? profilePath ?? ""
    }

    var getRole: String {
        return character ?? job ?? department?.rawValue ?? ""
    }
}
