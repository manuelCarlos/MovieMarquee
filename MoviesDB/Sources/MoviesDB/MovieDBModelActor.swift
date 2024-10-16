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
    
    func getFavorite(id: Int) -> Favorite? {
        let movie = getFavoriteMovie(id: id)
        if let movie {
            return Favorite(id: movie.id, name: movie.name)
        } else {
            return nil
        }
    }
    
    func addFavorite(_ movie: Favorite) throws {
        let favMovie = FavoriteMovie(id: movie.id, name: movie.name)
        modelContext.insert(favMovie)
        try modelContext.save()
    }
    
    func deleteFavorite(with id: Int) throws {
        modelContext.delete(getFavoriteMovie(id: id)!) // FIXME: - force
        try modelContext.save()
    }
    
    func fetchFavoriteMovies() throws -> [Favorite] {
        return try modelContext.fetch(FetchDescriptor<FavoriteMovie>()).map { Favorite(id: $0.id, name: $0.name) }
    }
    
    // MARK: - Private
    
    private func getFavoriteMovie(id: Int) -> FavoriteMovie? {
        let predicate: Predicate<FavoriteMovie>? = #Predicate { movie in movie.id == id }
        var fetchDescriptor = FetchDescriptor<FavoriteMovie>(predicate: predicate)
        fetchDescriptor.fetchLimit = 1
        let object = try? modelContext.fetch(fetchDescriptor)
        return object?.first
    }
}
