//
//  DiscoverScene.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
public struct DiscoverScene: View {

    @State private var viewModel = DiscoverSceneViewModel(interactor: DefaultMediaInteractor())
    @State private var isDataLoaded = false

    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    public var body: some View {
        NavigationStack {
            contentView
            .navigationBarTitle(Texts.NavigationBarTitle.discoverScreen)
        }
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
            DiscoverSlice(
                navigationTitle: "All Popular Movies",
                sliceTitle: Texts.SectionHeader.mostPopular,
                sliceItems: popularMovies,
                section: MediaSection.popularMovies,
                favoriteMoviesDBStore: favoriteMoviesDBStore
            )
            .opacity(isDataLoaded ? 1 : 0)
            .animation(.easeInOut(duration: 1), value: isDataLoaded)
            .task {
                isDataLoaded = true
            }
        }
    }
}
