//
//  MockMovies.swift
//  MovieMarqueeTests
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

@testable import Models

extension Movies {

    static func make(dates: Dates? = nil,
                     page: Int = 1,
                     results: [Movie] = [Movie.make(id: 10)],
                     totalPages: Int = 1,
                     totalResults: Int = 1) -> Movies {
        return Movies(dates: dates, page: page, results: results, totalPages: totalPages, totalResults: totalResults)
    }
}

