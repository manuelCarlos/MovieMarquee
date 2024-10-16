//
//  FavoriteMoviesScene.swift
//  FavoriteMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import SwiftUI
import SwiftData

import MoviesDB

@available(iOS 17, *)
public struct FavoriteMoviesScene: View {

    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    public var body: some View {
        NavigationStack {
            FavoriteMoviesList(favoriteMoviesDBStore: favoriteMoviesDBStore)
            .navigationTitle("Favorite Movies")
        }
    }
}
