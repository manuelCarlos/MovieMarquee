//
//  Movie.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public struct Movie: Codable, Identifiable, Hashable, Sendable {
    public let id: Int
    public let title: String
    public let adult: Bool?
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    public let releaseDate: Date?
    public let genreIDS: [Int]
    public let originalTitle: String?
    public let originalLanguage: OriginalLanguage?
    public let popularity: Double
    public let voteCount: Int?
    public let video: Bool
    public let voteAverage: Double?

    enum CodingKeys: String, CodingKey, Hashable, Sendable {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.genreIDS = try container.decode([Int].self, forKey: .genreIDS)
        self.id = try container.decode(Int.self, forKey: .id)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.originalLanguage = try container.decodeIfPresent(OriginalLanguage.self, forKey: .originalLanguage)
        self.title = try container.decode(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)

        let release = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        let formatter = DateFormatter.yyyyMMdd
        self.releaseDate = formatter.date(from: release ?? "")
    }

    init(
        id: Int,
        title: String,
        adult: Bool? = nil,
        posterPath: String? = nil,
        backdropPath: String? = nil,
        overview: String? = nil,
        releaseDate: Date? = nil,
        genreIDS: [Int],
        originalTitle: String? = nil,
        originalLanguage: OriginalLanguage? = nil,
        popularity: Double,
        voteCount: Int? = nil,
        video: Bool,
        voteAverage: Double? = nil
    ) {
        self.id = id
        self.title = title
        self.adult = adult
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.genreIDS = genreIDS
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
    }
}
