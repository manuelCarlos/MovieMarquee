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
    private let navigationTitle: String

    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore, navigationTitle: String = "Favorite Movies") {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.navigationTitle = navigationTitle
    }

    public var body: some View {
        NavigationStack {
            FavoriteMoviesList(favoriteMoviesDBStore: favoriteMoviesDBStore)
            .navigationTitle(navigationTitle)
        }
    }
}
