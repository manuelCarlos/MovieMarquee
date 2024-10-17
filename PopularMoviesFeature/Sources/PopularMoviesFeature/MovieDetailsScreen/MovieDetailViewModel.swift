//
//  MovieDetailViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

import Models

@available(iOS 17.0, *)
@Observable
final class MovieDetailViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded(any WatchableDetail)
    }
    
    let navigationTitle: String
    private let movieId: Int
    private let interactor: MediaDetailInteractor
    private(set) var state = State.idle
    
    init(interactor: MediaDetailInteractor, navigationTitle: String, movieId: Int) {
        self.interactor = interactor
        self.navigationTitle = navigationTitle
        self.movieId = movieId
    }

    func fetchMediaDetail() async {
        do {
            state = .loading
            let movieDetail = try await interactor.fetchMovieDetail(movieId: movieId)
            state = .loaded(movieDetail)
        } catch {
           state = .failed(error.localizedDescription)
        }
    }
}
