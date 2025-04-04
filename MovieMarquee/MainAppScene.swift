//
//  MainAppScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import PopularMoviesFeature
import FavoriteMoviesFeature
import MoviesDB

enum TabViewSection: Int {
    case discover
    case favorites
}

struct MainAppScene: View {

    @State var selectedTabIndex: Int = 0
    private let favoriteMoviesDBStore = FavoriteMoviesDBStore()

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            PopularMoviesFeatureView(favoriteMoviesDBStore: favoriteMoviesDBStore)
                .tabItem {
                    Label(Texts.TabBarItemTitle.discover, systemImage: "movieclapper")
                }
                .tag(TabViewSection.discover.rawValue)

            FavoriteMoviesScene(favoriteMoviesDBStore: favoriteMoviesDBStore)
                .tabItem {
                    Label(Texts.TabBarItemTitle.favorites, systemImage: "heart")
                }
                .tag(TabViewSection.favorites.rawValue)
        }
        .task { [favoriteMoviesDBStore] in
            try? await favoriteMoviesDBStore.loadAllMovies()
        }
    }
}
