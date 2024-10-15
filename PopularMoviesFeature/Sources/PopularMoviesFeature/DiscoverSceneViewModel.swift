//
//  DiscoverSceneViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Foundation

import Models

@available(iOS 17.0, *)
@Observable
public final class DiscoverSceneViewModel: @unchecked Sendable {

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

    func fetchMostPopularMovies() {
        Task {
            state = .loading
//            try await Task.sleep(for: .seconds(2)) // TODO: - remove later
            await fetchPopularMovies()
        }
    }

    // MARK: - Private

    private func fetchPopularMovies() async {
        do {
            let popularMovies = try await interactor.fetchNextPopularPageAsFullList()
            let watchable = filterWatchable(popularMovies)
            state = watchable.isEmpty ? .failed("There are no popular movies available.") : .loaded(watchable)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    private func filterWatchable(_ movies: [Watchable]) -> [Watchable] {
        return movies.filter { ($0 as? Movie)?.releaseDate != nil }
    }

    // MARK: - For testing purposes only

    #if DEBUG
    func fetchPopularMoviesAsync() async {
        state = .loading
        await fetchPopularMovies()
    }
    #endif
}
