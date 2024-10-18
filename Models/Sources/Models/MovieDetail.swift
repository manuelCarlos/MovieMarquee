//
//  MovieDetail.swift
//  Models
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

@available(iOS 16.0, *)
public struct MovieDetail: Codable, Identifiable, Hashable, Sendable, WatchableDetail {

    public let id: Int
    public let adult: Bool
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    public let releaseDate: Date?
    public let genres: [Genre]
    public let belongsToCollection: MovieCollection?
    public let budget: Int
    public var homepage: String?
    public let imdbId: String?
    public var originalLanguage: OriginalLanguage?
    public let originalTitle: String?
    public let popularity: Double
    public var productionCompanies: [ProductionCompany]?
    public var productionCountries: [ProductionCountry]?
    public let revenue: Int
    public let runtime: Int?
    public var spokenLanguages: [SpokenLanguage]?
    public let status, title: String
    public var tagline: String?
    public let video: Bool
    public let voteAverage: Double?
    public var voteCount: Int?
    public var credits: Credits?
    public var localizedRuntime: String? {
        guard let runtime else {
            return nil
        }
        let minutes = Duration.seconds(runtime * 60)
        return minutes.formatted(.units(width: .abbreviated))
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        adult = try container.decode(Bool.self, forKey: .adult)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        let release = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        let formatter = DateFormatter.yyyyMMdd
        releaseDate = formatter.date(from: release ?? "")
        genres = try container.decode([Genre].self, forKey: .genres)
        belongsToCollection = try container.decodeIfPresent(MovieCollection.self, forKey: .belongsToCollection)
        budget = try container.decode(Int.self, forKey: .budget)
        homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
        originalLanguage = try container.decodeIfPresent(OriginalLanguage.self, forKey: .originalLanguage)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        popularity = try container.decode(Double.self, forKey: .popularity)
        productionCompanies = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try container.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries)
        revenue = try container.decode(Int.self, forKey: .revenue)
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        spokenLanguages = try container.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages)
        status = try container.decode(String.self, forKey: .status)
        title = try container.decode(String.self, forKey: .title)
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        video = try container.decode(Bool.self, forKey: .video)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        credits = try container.decodeIfPresent(Credits.self, forKey: .credits)
    }

    // MARK: - Internal

    init(id: Int,
         adult: Bool,
         posterPath: String? = nil,
         backdropPath: String? = nil,
         overview: String? = nil,
         releaseDate: Date?,
         genres: [Genre],
         belongsToCollection: MovieCollection? = nil,
         budget: Int,
         homepage: String? = nil,
         imdbId: String? = nil,
         originalLanguage: OriginalLanguage? = nil,
         originalTitle: String? = nil,
         popularity: Double,
         productionCompanies: [ProductionCompany]? = nil,
         productionCountries: [ProductionCountry]? = nil,
         revenue: Int,
         runtime: Int? = nil,
         spokenLanguages: [SpokenLanguage]? = nil,
         status: String, title: String,
         tagline: String? = nil,
         video: Bool,
         voteAverage: Double? = nil,
         voteCount: Int? = nil,
         credits: Credits? = nil) {
        self.id = id
        self.adult = adult
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.genres = genres
        self.belongsToCollection = belongsToCollection
        self.budget = budget
        self.homepage = homepage
        self.imdbId = imdbId
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.popularity = popularity
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.title = title
        self.tagline = tagline
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.credits = credits
    }
}
