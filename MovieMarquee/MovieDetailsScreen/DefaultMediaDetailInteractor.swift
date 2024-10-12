//
//  DefaultMediaDetailInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

protocol MediaDetailInteractor: Sendable {
    func getMovieDetail(_ id: Int) async throws -> Watchable?
}

// TODO: - Rename file and DefaultMovieDetailInteractor
final class DefaultMediaDetailInteractor: Sendable, MediaDetailInteractor {

    private let movieService: MediaService = MovieService.shared

    func getMovieDetail(_ id: Int) async throws -> Watchable? {
        return try await movieService.fetchMediaDetails(id: id)
    }
}
