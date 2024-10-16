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

    @State private var favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        if favoriteMoviesDBStore.movies.isEmpty {
            ContentUnavailableView {
                Text("No Favorite movies for now")
            } description: {
                Text("Favorite some movies to see them here")
            }
        } else {
            List {
                ForEach(favoriteMoviesDBStore.movies) { movie in
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
            let destination = favoriteMoviesDBStore.movies[index]
            try? favoriteMoviesDBStore.deleteFavorite(id: destination.id)
        }
    }
}
