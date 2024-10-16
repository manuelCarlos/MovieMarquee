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
    
    public var movies: [Favorite] = []
    
    private let movieDBModelActor: MovieDBModelActor = {
        let schema = Schema([FavoriteMovieModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            return MovieDBModelActor(modelContainer: modelContainer)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    public init() {}
    
    public func loadFavoriteMovies() async throws {
        movies = await (try? movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func addFavorite(_ movie: Favorite) async throws {
        try await movieDBModelActor.addFavorite(movie)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func deleteFavorite(id: Int) async throws {
        try await movieDBModelActor.deleteFavorite(with: id)
        movies = (try? await movieDBModelActor.fetchFavoriteMovies()) ?? []
    }
    
    public func getMovie(id: Int) async throws -> Favorite? {
        return await movieDBModelActor.getFavorite(id: id)
    }
}
