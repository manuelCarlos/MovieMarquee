//
//  Movie.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public struct Movie: Identifiable, Hashable, Watchable {
    public let id: Int
    public let title: String
    public let adult: Bool?
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    public let genreIds: [Int]
    public let originalTitle: String?
    public let originalLanguage: OriginalLanguage?
    public let popularity: Double
    public let voteCount: Int?
    public let video: Bool
    public let voteAverage: Double?
    public var dateOfRelease: Date? {
        guard let releaseDate else {
            return nil
        }
        return dateOfReleaseFormatter.date(from: releaseDate)
    }

    /// Formated as "1974-10-06".
    private let releaseDate: String?

    // MARK: - Internal

    init(id: Int,
         title: String,
         adult: Bool? = nil,
         posterPath: String? = nil,
         backdropPath: String? = nil,
         overview: String? = nil,
         releaseDate: String? = nil,
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
