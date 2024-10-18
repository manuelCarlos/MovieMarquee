//
//  Fetchable.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

@available(iOS 13.0, *)
protocol Fetchable: Sendable {
    func fetchSinglePage() async throws -> [Watchable]
    func fetchWithNextPage() async throws -> [Watchable]
}
