//
//  MovieService.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService
import Models

final class MovieService: Sendable, MediaService {
    private let requestManager: RequestManagerProtocol

    public static let shared = MovieService()

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func fetchMedia(request: NetworkRequest) async throws -> [Watchable] {
        let movies: Movies = try await requestManager.decode(networkRequest: request)
        return movies.results
    }

    func fetchMediaDetails(id: Int) async throws -> WatchableDetail? {
        let requestData = MovieRequest.getMovieDetail(id: id)
        let movie: MovieDetail = try await requestManager.decode(networkRequest: requestData)
        return movie
    }
}
