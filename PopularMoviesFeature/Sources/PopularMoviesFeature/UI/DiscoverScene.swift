//
//  DiscoverScene.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftData
import SwiftUI

@available(iOS 17.0, *)
public struct DiscoverScene: View {

    @State private var viewModel: DiscoverSceneViewModel = DiscoverSceneViewModel(interactor: DefaultMediaInteractor())
    @State private var isDataLoaded = false
    private let modelContext: ModelContext

    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    public var body: some View {
        NavigationView {
            contentView
        }
        .navigationBarTitle(Texts.NavigationBarTitle.discoverScreen)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Private

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                viewModel.fetchMostPopularMovies()
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(error: error) {
                viewModel.fetchMostPopularMovies()
            }
        case .loaded(let popularMovies):
            LoadedStateView(popularMovies: popularMovies, modelContext: modelContext)
                .opacity(isDataLoaded ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: isDataLoaded)
                .task {
                    isDataLoaded = true
                }
        }
    }

    private struct LoadedStateView: View {
        let popularMovies: [Watchable]
        let modelContext: ModelContext

        var body: some View {
            DiscoverSlice(
                sliceTitle: Texts.SectionHeader.mostPopular,
                sliceItems: popularMovies,
                section: MediaSection.popularMovies,
                modelContext: modelContext
            )
        }
    }
}
