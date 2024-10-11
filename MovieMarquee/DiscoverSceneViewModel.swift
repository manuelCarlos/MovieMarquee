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

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Watchable])
    }

    private let interactor: MediaInteractor

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
            let movies = try await interactor.fetchNextPopularPageAsFullList()
            let popularMovies = filterWatchable(movies)
            state = popularMovies.isEmpty ? .failed("There are no popular movies available.") : .loaded(popularMovies)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    private func filterWatchable(_ movies: [Watchable]) -> [Watchable] {
        return movies.filter { ($0 as? Movie)?.releaseDate != nil }
    }

    // MARK: - For testing purposes only

    #if DEBUG
    func fetchMediaAsync() async {
        state = .loading
        await loadPopularMovies()
    }
    #endif
}
