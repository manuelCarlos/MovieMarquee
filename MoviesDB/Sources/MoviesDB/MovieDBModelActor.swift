//
//  MovieDBModelActor.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17.0, *)
protocol MovieDBModelStorage {
    func fetchAllFavoriteMovies() async throws -> [FavoriteMovie]
    func fetchFavoriteMovie(with id: Int) async throws -> FavoriteMovie
    func insertFavoriteMovie(_ movie: FavoriteMovie) async throws
    func deleteFavoriteMovie(with id: Int) async throws
    func deleteFavoriteMovies(_ movies: [FavoriteMovie]) async throws
}

@available(iOS 17, *)
@ModelActor
final actor MovieDBModelActor: MovieDBModelStorage, Sendable {

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

    func fetchAllFavoriteMovies() async throws -> [FavoriteMovie] {
        return try modelContext.fetch(FetchDescriptor<FavoriteMovieModel>()).map { FavoriteMovie(id: $0.id, name: $0.name) }
    }

    func fetchFavoriteMovie(with id: Int) async throws -> FavoriteMovie {
        let movie = fetchFavoriteMovieModel(id: id)
        if let movie {
            return FavoriteMovie(id: movie.id, name: movie.name)
        } else {
            throw MoviesDBError.notFound
        }
    }

    /// Inserts a `FavoriteMovie` instance in the DB iff the movie is not already saved.
    /// Because the `FavoriteMovieModel.id` is marked as @unique, if the `id` of movie instance passed to this method is already contained in the DB then this method will
    /// update the existing record.
    func insertFavoriteMovie(_ movie: FavoriteMovie) async throws {
        let favMovie = FavoriteMovieModel(id: movie.id, name: movie.name)
        modelContext.insert(favMovie)
        try modelContext.save()
    }

    func deleteFavoriteMovie(with id: Int) async throws {
        try deleteFavoriteMovieModel(with: id)
    }

    func deleteFavoriteMovies(_ movies: [FavoriteMovie]) async throws {
        for movie in movies {
            try deleteFavoriteMovieModel(with: movie.id)
        }
    }

    // MARK: - Private

    private func deleteFavoriteMovieModel(with id: Int) throws {
        let predicate: Predicate<FavoriteMovieModel>? = #Predicate { movie in movie.id == id }
        try modelContext.delete(
            model: FavoriteMovieModel.self,
            where: predicate
        )
        try modelContext.save()
    }

    private func fetchFavoriteMovieModel(id: Int) -> FavoriteMovieModel? {
        let predicate: Predicate<FavoriteMovieModel>? = #Predicate { movie in movie.id == id }
        var fetchDescriptor = FetchDescriptor<FavoriteMovieModel>(predicate: predicate)
        fetchDescriptor.fetchLimit = 1
        let object = try? modelContext.fetch(fetchDescriptor)
        return object?.first
    }
}
