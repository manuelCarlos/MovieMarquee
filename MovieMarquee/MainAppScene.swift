//
//  MainAppScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

enum TabViewSection: Int {
    case discover
}

struct MainAppScene: View {

    @State var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            DiscoverScene(viewModel: DiscoverSceneViewModel(interactor: DefaultMediaInteractor()))
                .tabItem {
                    Label("Discover", systemImage: Icons.TabBar.discover.rawValue)
                }
                .tag(TabViewSection.discover.rawValue)
        }
        .navigationBarTitle("title")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}
