//
//  MovieDetails.swift
//  Models
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

@available(iOS 16.0, *)
public struct MovieDetails: Codable, Identifiable, Hashable, Sendable, WatchableDetails {
    public let id: Int
    public let adult: Bool
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    public var dateOfRelease: Date? {
        guard let releaseDate else {
            return nil
        }
        return dateOfReleaseFormatter.date(from: releaseDate)
    }
    public let genres: [Genre]
    public let belongsToCollection: MovieCollection?
    public let budget: Int
    public let homepage: String?
    public let imdbId: String?
    public let originalLanguage: OriginalLanguage?
    public let originalTitle: String?
    public let popularity: Double
    public let productionCompanies: [ProductionCompany]?
    public let productionCountries: [ProductionCountry]?
    public let revenue: Int
    public let runtime: Int?
    public let spokenLanguages: [SpokenLanguage]?
    public let status, title: String
    public var tagline: String?
    public let video: Bool
    public let voteAverage: Double?
    public let voteCount: Int?
    public let credits: Credits?
    public var localizedRuntime: String? {
        guard let runtime else {
            return nil
        }
        let minutes = Duration.seconds(runtime * 60)
        return minutes.formatted(.units(width: .abbreviated))
    }

    private let releaseDate: String?

    // MARK: - Internal

    init(id: Int,
         adult: Bool,
         posterPath: String? = nil,
         backdropPath: String? = nil,
         overview: String? = nil,
         releaseDate: String?,
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
