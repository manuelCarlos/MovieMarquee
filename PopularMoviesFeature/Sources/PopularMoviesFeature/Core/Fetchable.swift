//
//  Fetchable.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import Models

@available(iOS 13.0, *)
protocol Fetchable: Sendable {
    func fetchNextPage() async throws -> [Watchable]
}
