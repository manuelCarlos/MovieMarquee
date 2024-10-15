//
//  DefaultMediaDetailInteractor.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

protocol MediaDetailInteractor: Sendable {
    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetail
}

@available(iOS 16.0, *)
// TODO: - Rename file and DefaultMovieDetailInteractor
final class DefaultMediaDetailInteractor: Sendable, MediaDetailInteractor {

    private let movieService: MediaService

    init(movieService: MediaService = MovieService.shared) {
        self.movieService = movieService
    }

    func fetchMovieDetail(movieId: Int) async throws -> WatchableDetail {
        return try await movieService.fetchMediaDetails(mediaId: movieId)
    }
}
