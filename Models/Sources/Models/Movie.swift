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
    public let genreIds: [Int]
    public let originalTitle: String?
    public let originalLanguage: OriginalLanguage?
    public let popularity: Double
    public let voteCount: Int?
    public let video: Bool
    public let voteAverage: Double?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        let release = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        let formatter = DateFormatter.yyyyMMdd
        releaseDate = formatter.date(from: release ?? "")
        genreIds = try container.decode([Int].self, forKey: .genreIds)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        originalLanguage = try container.decodeIfPresent(OriginalLanguage.self, forKey: .originalLanguage)
        popularity = try container.decode(Double.self, forKey: .popularity)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        video = try container.decode(Bool.self, forKey: .video)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    }

    // MARK: - Internal

    init(id: Int,
         title: String,
         adult: Bool? = nil,
         posterPath: String? = nil,
         backdropPath: String? = nil,
         overview: String? = nil,
         releaseDate: Date? = nil,
         genreIds: [Int],
         originalTitle: String? = nil,
         originalLanguage: OriginalLanguage? = nil,
         popularity: Double,
         voteCount: Int? = nil,
         video: Bool,
         voteAverage: Double? = nil) {
        self.id = id
        self.title = title
        self.adult = adult
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.genreIds = genreIds
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
    }
}
