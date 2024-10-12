//
//  DefaultMovieDetailInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

// TODO: - Rename file and DefaultMovieDetailInteractor
final class DefaultMovieDetailInteractor: Sendable, MovieDetailInteractor {

    private let movieService: MediaService = MovieService.shared

    func getMovieDetail(_ id: Int) async throws -> Watchable? {
        return try await movieService.fetchMediaDetails(id: id)
    }
}
