//
//  MovieDetailViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

import Models

@Observable
final class MovieDetailViewModel: @unchecked Sendable {

    private let interactor: MovieDetailInteractor
    let movieTitle: String
    let id: Int
    private(set) var media: MovieDetail?

    init(interactor: MovieDetailInteractor, movieTitle: String, id: Int) {
        self.interactor = interactor
        self.movieTitle = movieTitle
        self.id = id
    }

    func getMediaDetail() async {
        do {
            guard let movieDetail = try await interactor.getMovieDetail(id) else {
                return
            }
            guard let detail = movieDetail as? MovieDetail else {
                return
            }
            self.media = detail
        } catch {
            // TODO: - handle error
        }
    }
}
