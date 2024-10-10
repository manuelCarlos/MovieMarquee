//
//  DiscoverSceneViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import Foundation

import Models
import NetworkService // TODO: - remove

@Observable
final class DiscoverSceneViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Watchable])
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
            let movies = try await interactor.fetchNextPopularPageAsFullList()
            let popularMovies = mapToMovies(watchables: movies)
            state = .loaded(popularMovies)
        } catch {
            state = .failed(FetchError.networkError)
        }
    }

    private func mapToMovies(watchables: [Watchable]) -> [Watchable] {
        return watchables.compactMap { $0 as? Movie }.filter { $0.releaseDate != nil }
    }
}