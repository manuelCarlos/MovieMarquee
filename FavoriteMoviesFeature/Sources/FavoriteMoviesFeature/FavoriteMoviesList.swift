//
//  FavoriteMoviesList.swift
//  FavoriteMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17, *)
struct FavoriteMoviesList: View {

    @Query(sort: [SortDescriptor(\FavoriteMovie.releaseDate, order: .reverse),
                  SortDescriptor(\FavoriteMovie.name)])
    private var favorites: [FavoriteMovie]

    private let modelContext: ModelContext

    init(sort: SortDescriptor<FavoriteMovie>, modelContext: ModelContext) {
        _favorites = Query(sort: [sort])
        self.modelContext = modelContext
    }

    var body: some View {
        if favorites.isEmpty {
            ContentUnavailableView {
                Text("No Favorite movies for now")
            } description: {
                Text("Favorite some movies to see them here")
            }
        } else {
            List {
                ForEach(favorites) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteFavorites)
            }
        }
    }

    // MARK: - Private

    private func deleteFavorites(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = favorites[index]
            modelContext.delete(destination)
            try? modelContext.save()
        }
    }
}
