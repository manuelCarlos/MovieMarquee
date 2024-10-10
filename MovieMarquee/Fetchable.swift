//
//  Fetchable.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

protocol Fetchable: Sendable {
    func fetchSinglePage() async throws -> [Watchable]
    func fetchWithNextPage() async throws -> [Watchable]
}
