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
    private var navigationTitle: String = Texts.favoriteMovies

    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    public var body: some View {
        NavigationStack {
            FavoriteMoviesList(favoriteMoviesDBStore: favoriteMoviesDBStore)
            .navigationTitle(navigationTitle)
        }
    }

    // MARK: - Testing interface

    #if DEBUG
    init(favoriteMoviesDBStore: FavoriteMoviesDBStore, navigationTitle: String) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.navigationTitle = navigationTitle
    }
    #endif
}
