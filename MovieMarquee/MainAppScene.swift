//
//  MainAppScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI
import SwiftData

import PopularMoviesFeature
import FavoriteMoviesFeature

enum TabViewSection: Int {
    case discover
    case favorites
}

struct MainAppScene: View {

    @State var selectedTabIndex: Int = 0
    @Environment(\.modelContext) var modelContext

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            DiscoverScene(modelContext: modelContext)
                .tabItem {
                    Label("Discover", systemImage: "penci")
                }
                .tag(TabViewSection.discover.rawValue)

            FavoriteMoviesScene(modelContext: modelContext)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(TabViewSection.favorites.rawValue)
                .navigationBarTitle("title")
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}
