//
//  DiscoverScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

struct DiscoverScene: View {

    @State private var viewModel: DiscoverSceneViewModel
    @State private var isDataLoaded = false

    init(viewModel: DiscoverSceneViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            contentView
        }
        .navigationBarTitle(Texts.NavigationBarTitle.discoverScreen)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                viewModel.fetchMedia()
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(error: error) {
                viewModel.fetchMedia()
            }
        case .loaded(let popularMovies):
            LoadedStateView(popularMovies: popularMovies)
                .opacity(isDataLoaded ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: isDataLoaded)
                .task {
                    isDataLoaded = true
                }
        }
    }

    private struct LoadedStateView: View {
        let popularMovies: [Watchable]

        var body: some View {
            DiscoverSlice(
                sliceTitle: Texts.SectionHeader.mostPopular,
                sliceItems: popularMovies,
                section: MediaSection.popularMovies
            )
        }
    }
}
