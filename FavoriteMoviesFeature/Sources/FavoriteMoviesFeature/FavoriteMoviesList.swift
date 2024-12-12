//
//  FavoriteMoviesList.swift
//  FavoriteMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import SwiftUI

import MoviesDB

@available(iOS 17, *)
struct FavoriteMoviesList: View {

    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        if favoriteMoviesDBStore.movies.isEmpty {
            ContentUnavailableView {
                Text(Texts.noFavoriteMoviesTitle)
            } description: {
                Text(Texts.noFavoriteMoviesDescription)
            }
        } else {
            List {
                ForEach(favoriteMoviesDBStore.movies) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: { indexSet in
                    Task { @MainActor [favoriteMoviesDBStore] in
                        try? await favoriteMoviesDBStore.deleteMovies(indexSet: indexSet)
                    }
                })
            }
        }
    }
}
