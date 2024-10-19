//
//  MovieDetailsViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

import Models

@available(iOS 17.0, *)
@Observable
final class MovieDetailsViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded(WatchableDetail)
    }

    let navigationTitle: String
    private let movieId: Int
    private let controller: MediaDetailsController
    private(set) var state = State.idle

    init(controller: MediaDetailsController, navigationTitle: String, movieId: Int) {
        self.controller = controller
        self.navigationTitle = navigationTitle
        self.movieId = movieId
    }

    func fetchMediaDetail() async {
        do {
            state = .loading
            let movieDetail = try await controller.fetchMovieDetail(movieId: movieId)
            state = .loaded(movieDetail)
        } catch {
           state = .failed(error.localizedDescription)
        }
    }
}
