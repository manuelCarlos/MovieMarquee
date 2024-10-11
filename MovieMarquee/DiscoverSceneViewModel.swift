//
//  DiscoverSceneViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import Foundation

import Models

@Observable
final class DiscoverSceneViewModel: @unchecked Sendable {

    enum State: Hashable {
        case idle
        case loading
        case failed(String)
        case loaded([Movie])
    }

    let interactor: MediaInteractor

    private(set) var state = State.idle

    init(interactor: MediaInteractor) {
        self.interactor = interactor
    }

    func fetchMedia() {
        Task {
            state = .loading
            try await Task.sleep(for: .seconds(2)) // TODO: - remove later
            await loadPopularMovies()
        }
    }

    // MARK: - Private

    private func loadPopularMovies() async {
        do {
            if let movies = try await interactor.fetchNextPopularPageAsFullList() as? [Movie] {
                let popularMovies = filterWatchable(movies: movies)
                state = .loaded(popularMovies)
            } else {
                state = .failed("There are no popular movies available.")
            }
        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    private func filterWatchable(movies: [Movie]) -> [Movie] {
        return movies.filter { $0.releaseDate != nil }
    }

    // MARK: - For testing purposes only

    #if DEBUG
    func fetMediaAsync() async {
        state = .loading
        await loadPopularMovies()
    }
    #endif
}
