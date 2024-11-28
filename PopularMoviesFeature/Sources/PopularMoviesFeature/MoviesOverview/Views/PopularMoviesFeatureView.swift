//
//  PopularMoviesFeatureView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import Lego
import MoviesDB

@available(iOS 17.0, *)
public struct PopularMoviesFeatureView: View {

    private let viewModel: PopularMoviesFeatureViewModel
    @State private var isDataLoaded = false

    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = PopularMoviesFeatureViewModel(controller: MoviesOverviewController())
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    public var body: some View {
        NavigationStack {
            contentView
            .navigationBarTitle(Texts.popularMoviesFeatureNavigationBarTitle)
        }
    }

    // MARK: - Private

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { await viewModel.fetchMostPopularMovies() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { await viewModel.fetchMostPopularMovies() }
            }
        case .loaded(let movies):
            MoviesOverviewList(
                navigationTitle: Texts.popularMoviesFeatureNavigationTitle,
                title: Texts.popularMoviesFeatureViewTitle,
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

    #if DEBUG
    /// A convenience initializer for testing purposes **only** that allows injection of a mock dependencies.
    /// - Parameters:
    ///   - viewModel:  A mock or alternative implementation of `PopularMoviesFeatureViewModel` used for testing.
    ///   - favoriteMoviesDBStore: A mock or alternative implementation of `FavoriteMoviesDBStore` used for testing.
    init(viewModel: PopularMoviesFeatureViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = viewModel
        self.isDataLoaded = true
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }
    #endif
}
