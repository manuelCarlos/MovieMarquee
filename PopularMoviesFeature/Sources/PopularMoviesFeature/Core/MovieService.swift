//
//  MovieService.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Models
import NetworkService

@available(iOS 16.0, *)
final class MovieService: Sendable, MediaService {

    public static let shared = MovieService()

    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func fetchMedia(with requestComponents: RequestComponents) async throws -> [Watchable] {
        let movies: Movies = try await requestManager.decode(with: requestComponents)
        return movies.results
    }

    func fetchMediaDetails(mediaId: Int) async throws -> WatchableDetails {
        let requestData = MovieRequest.getMovieDetail(id: mediaId)
        let movieDetail: MovieDetails = try await requestManager.decode(with: requestData)
        return movieDetail
    }

    func fetchMediaCredits(mediaId: Int) async throws -> Credits {
        let requestData = MovieRequest.getCredits(id: mediaId)
        let credits: Credits = try await requestManager.decode(with: requestData)
        return credits
    }
}
