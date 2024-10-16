//
//  MovieDBModelActor.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@ModelActor
final actor MovieDBModelActor {

    static let shared: MovieDBModelActor = {
        let schema = Schema([FavoriteMovieModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            let modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            return MovieDBModelActor(modelContainer: modelContainer)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    func fetchFavoriteMovie(id: Int) -> FavoriteMovie? {
        let movie = fetchFavoriteMovieModel(id: id)
        if let movie {
            return FavoriteMovie(id: movie.id, name: movie.name)
        } else {
            return nil
        }
    }
    
    func addFavoriteMovie(_ movie: FavoriteMovie) throws {
        let favMovie = FavoriteMovieModel(id: movie.id, name: movie.name)
        modelContext.insert(favMovie)
        try modelContext.save()
    }
    
    func deleteFavoriteMovie(with id: Int) throws {
        if let movie = fetchFavoriteMovieModel(id: id) {
            modelContext.delete(movie)
            try modelContext.save()
        } else {
            assertionFailure("Oops, no movie with id \(id) found.")
        }
    }
    
    func fetchFavoriteMovies() throws -> [FavoriteMovie] {
        return try modelContext.fetch(FetchDescriptor<FavoriteMovieModel>()).map { FavoriteMovie(id: $0.id, name: $0.name) }
    }
    
    // MARK: - Private
    
    private func fetchFavoriteMovieModel(id: Int) -> FavoriteMovieModel? {
        let predicate: Predicate<FavoriteMovieModel>? = #Predicate { movie in movie.id == id }
        var fetchDescriptor = FetchDescriptor<FavoriteMovieModel>(predicate: predicate)
        fetchDescriptor.fetchLimit = 1
        let object = try? modelContext.fetch(fetchDescriptor)
        return object?.first
    }
}
