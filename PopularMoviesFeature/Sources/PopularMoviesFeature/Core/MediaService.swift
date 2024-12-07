//
//  MediaService.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Models
import NetworkService

@available(iOS 13.0, *)
protocol MediaService: Sendable {
    func fetchMedia(with requestComponents: RequestComponents) async throws -> [Watchable]
    func fetchMediaDetails(mediaId: Int) async throws -> WatchableDetails
    func fetchMediaCredits(mediaId: Int) async throws -> Credits
}
