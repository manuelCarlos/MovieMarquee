//
//  MainAppScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import PopularMoviesFeature

enum TabViewSection: Int {
    case discover
    case favorites
}

struct MainAppScene: View {

    @State var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            PopularMoviesFeatureView()
                .tabItem {
                    Label(Texts.TabBarItemTitle.discover, systemImage: "movieclapper")
                }
                .tag(TabViewSection.discover.rawValue)
        }
    }
}
