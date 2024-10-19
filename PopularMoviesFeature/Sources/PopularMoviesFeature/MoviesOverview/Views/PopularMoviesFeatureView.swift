//
//  PopularMoviesFeatureView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
public struct PopularMoviesFeatureView: View {

    @State private var viewModel = PopularMoviesFeatureViewModel(controller: MoviesOverviewController())
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
        case .loaded(let movies):
            MoviesOverviewList(
                navigationTitle: "All Popular Movies",
                title: Texts.SectionHeader.mostPopular,
                movies: movies,
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
