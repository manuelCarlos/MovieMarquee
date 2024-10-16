//
//  MovieDBService.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
final class MovieDBService: @unchecked Sendable {

    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = MovieDBService()

    @MainActor
    private init(isStoredInMemoryOnly: Bool = false) {
        do {
            modelContainer = try ModelContainer(for: FavoriteMovie.self,
                                                configurations: ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly))
            modelContext = modelContainer.mainContext
        } catch {
            fatalError("Was not able to create the model container: \(error.localizedDescription).")
        }
    }

    func getMovie(id: Int) -> FavoriteMovie? {
        let predicate: Predicate<FavoriteMovie>? = #Predicate { movie in movie.id == id }
        var fetchDescriptor = FetchDescriptor<FavoriteMovie>(predicate: predicate)
        fetchDescriptor.fetchLimit = 1
        let object = try? modelContext.fetch(fetchDescriptor)
        return object?.first
    }

    func addFavorite(_ movie: FavoriteMovie) throws {
        modelContext.insert(movie)
        try modelContext.save()
    }

    func deleteFavorite(with id: Int) throws {
        modelContext.delete(getMovie(id: id)!)
        try modelContext.save()
    }

    func fetchFavoriteMovies() throws -> [FavoriteMovie] {
        return try modelContext.fetch(FetchDescriptor<FavoriteMovie>())
    }
}
