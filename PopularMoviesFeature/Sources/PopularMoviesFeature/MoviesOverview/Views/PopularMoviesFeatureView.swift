//
//  PopularMoviesFeatureView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import Lego
import MoviesDB

/// Provides the UI entry point for the "Popular Movies Feature".
/// This includes displaying the currently 20 most popular movies in an horizontally scrolling carousel.
///
///    From this UI the user can navigate to either:
///    - The movie details screen, that allows marking the movie as favorite, and displays the name and photo of the cast members.
///    - The full list of popular movies, in a paginated scroll.
@available(iOS 17.0, *)
public struct PopularMoviesFeatureView: View {

    @State private var isDataLoaded = false

    private let viewModel: PopularMoviesFeatureViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore
    private let movieService = MovieService()

    /// Instantiate a `PopularMoviesFeatureView` SwiftUI view.
    /// - Parameter favoriteMoviesDBStore: The store that manages the DB persisted favorite movies data.
    public init(favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        let mediaFetcher = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                                service: movieService)
        self.viewModel = PopularMoviesFeatureViewModel(controller: MoviesOverviewController(popularMoviesFetcher: mediaFetcher))
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
                Task { [viewModel] in await viewModel.fetchMostPopularMovies() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { [viewModel] in await viewModel.fetchMostPopularMovies() }
            }
        case .loaded(let movies):
            MoviesOverviewList(
                navigationTitle: Texts.popularMoviesFeatureNavigationTitle,
                title: Texts.popularMoviesFeatureViewTitle,
                movies: movies,
                favoriteMoviesDBStore: favoriteMoviesDBStore,
                movieService: movieService
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
