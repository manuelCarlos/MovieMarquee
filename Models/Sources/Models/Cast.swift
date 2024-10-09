//
//  Cast.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

typealias Crew = Cast

struct Cast: Codable, Identifiable, Hashable, Sendable {

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

    init(from decoder: Decoder) throws {
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

        let release = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        let formatter = DateFormatter.yyyyMMdd
        releaseDate = formatter.date(from: release ?? "")
    }

    let adult: Bool
    let gender: Int?
    let id: Int
    let knownForDepartment: Department?
    let name: String?
    let originalName: String?
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let department: Department?
    let job: String?
    let backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: Date?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

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

private extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
