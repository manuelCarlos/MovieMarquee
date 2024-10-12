//
//  WatchableDetail.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import Models

protocol WatchableDetail: Watchable {
    var genres: [Genre] { get }
    var productionCompanies: [ProductionCompany]? { get }
    var productionCountries: [ProductionCountry]? { get }
    var tagline: String? { get }
    var credits: Credits? { get }
    var spokenLanguages: [SpokenLanguage]? { get }
    var homepage: String? { get }
}
