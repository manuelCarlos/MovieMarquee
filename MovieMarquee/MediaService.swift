//
//  MediaService.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import NetworkService

// TODO: - Rename
protocol MediaService: Sendable {
    func fetchMedia(request: NetworkRequest) async throws -> [Watchable]
    func fetchMediaDetails(id: Int) async throws -> WatchableDetail?
}
