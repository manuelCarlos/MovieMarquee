//
//  MediaService.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService
import Models

// TODO: - Rename
protocol MediaService: Sendable {
    func fetchMedia(request: NetworkRequest) async throws -> [Watchable]
    func fetchMediaDetails(mediaId: Int) async throws -> WatchableDetail
    func fetchMediaCredits(mediaId: Int) async throws -> Credits
}
