//
//  PopularMoviesFeatureViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Foundation

import Models

@available(iOS 17.0, *)
@Observable
public final class PopularMoviesFeatureViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Watchable])
    }

    private let controller: MediaOverviewController

    private(set) var state = State.idle

    init(controller: MediaOverviewController) {
        self.controller = controller
    }

    func fetchMostPopularMovies() async {
        state = .loading
        await fetchPopularMovies()
    }

    // MARK: - Private

    private func fetchPopularMovies() async {
        do {
            let popularMovies = try await controller.fetchPopularMoviesNextPage()
            let watchable = filterWatchable(popularMovies)
            state = watchable.isEmpty ? .failed(MediaServiceError.noPopularMoviesAvailable.localizedDescription) : .loaded(watchable)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    private func filterWatchable(_ movies: [Watchable]) -> [Watchable] {
        return movies.filter { ($0 as? Movie)?.releaseDate != nil }
    }
}
