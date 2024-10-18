//
//  MediaService.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService
import Models

// TODO: - Rename
@available(iOS 13.0, *)
protocol MediaService: Sendable {
    func fetchMedia(request: NetworkRequest) async throws -> [Watchable]
    func fetchMediaDetails(mediaId: Int) async throws -> any WatchableDetail
    func fetchMediaCredits(mediaId: Int) async throws -> Credits
}
