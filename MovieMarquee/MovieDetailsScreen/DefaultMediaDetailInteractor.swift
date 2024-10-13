//
//  DefaultMediaDetailInteractor.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

protocol MediaDetailInteractor: Sendable {
    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetail
}

// TODO: - Rename file and DefaultMovieDetailInteractor
final class DefaultMediaDetailInteractor: Sendable, MediaDetailInteractor {

    private let movieService: MediaService = MovieService.shared

    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetail {
        return try await movieService.fetchMediaDetails(mediaId: movieId)
    }
}
