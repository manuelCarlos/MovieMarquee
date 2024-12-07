//
//  MockWatchableDetail.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 12.10.24.
//

@testable import Models
@testable import PopularMoviesFeature

struct MockWatchableDetail: WatchableDetails {
    var localizedRuntime: String?
    var genres: [Models.Genre] = [Models.Genre(id: 1, name: "Drama")]
    var productionCompanies: [Models.ProductionCompany]? = []
    var productionCountries: [Models.ProductionCountry]?
    var tagline: String? = "A thrilling adventure"
    var credits: Credits?
    var spokenLanguages: [SpokenLanguage]?
    var homepage: String? = "https://www.example.com"
    var id: Int = 1
    var title: String = "Mock Movie"
    var voteAverage: Double? = 7.5
    var posterPath: String? = "/path/to/mock_poster.jpg"
    var backdropPath: String? = "/path/to/mock_backdrop.jpg"
    var overview: String? = "This is a mock movie used for testing purposes."
    var originalTitle: String? = "Mock Movie Original"
    var originalLanguage: OriginalLanguage? = "en"
    var voteCount: Int? = 1000
    var popularity: Double = 8.7
}
