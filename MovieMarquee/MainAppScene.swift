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
}

struct MainAppScene: View {

    @State var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            DiscoverScene()
                .tabItem {
                    Label("Discover", systemImage: "penci")
                }
                .tag(TabViewSection.discover.rawValue)
            EmptyView()
        }
        .navigationBarTitle("title")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}
