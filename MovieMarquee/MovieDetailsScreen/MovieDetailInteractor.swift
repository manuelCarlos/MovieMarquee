//
//  MovieDetailInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

protocol MovieDetailInteractor: Sendable {
    func getMovieDetail(_ id: Int) async throws -> Watchable?
}
