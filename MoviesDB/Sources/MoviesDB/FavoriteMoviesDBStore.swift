//
//  FavoriteMoviesDBStore.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17.0, *)
@Observable
public final class FavoriteMoviesDBStore: @unchecked Sendable {
    
    public var movies: [FavoriteMovie] = []
    
    private let movieDBModelActor = MovieDBModelActor.shared

    public init() {}
    
    public func loadFavoriteMovies() async throws {
        movies = await (try? movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func addFavorite(_ movie: FavoriteMovie) async throws {
        try await movieDBModelActor.addFavoriteMovie(movie)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func deleteFavorite(id: Int) async throws {
        try await movieDBModelActor.deleteFavoriteMovie(with: id)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func getMovie(id: Int) async throws -> FavoriteMovie? {
        return await movieDBModelActor.fetchFavoriteMovie(id: id)
    }
}
