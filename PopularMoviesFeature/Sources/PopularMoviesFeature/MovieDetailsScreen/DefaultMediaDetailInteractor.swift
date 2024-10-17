//
//  DefaultMediaDetailInteractor.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

@available(iOS 13.0, *)
protocol MediaDetailInteractor: Sendable {
    func fetchMovieDetail(movieId: Int) async throws -> any WatchableDetail
}

@available(iOS 16.0, *)
// TODO: - Rename file and DefaultMovieDetailInteractor
final class DefaultMediaDetailInteractor: Sendable, MediaDetailInteractor {

    private let movieService: MediaService

    init(movieService: MediaService = MovieService.shared) {
        self.movieService = movieService
    }

    func fetchMovieDetail(movieId: Int) async throws -> any WatchableDetail {
        return try await movieService.fetchMediaDetails(mediaId: movieId)
    }
}
