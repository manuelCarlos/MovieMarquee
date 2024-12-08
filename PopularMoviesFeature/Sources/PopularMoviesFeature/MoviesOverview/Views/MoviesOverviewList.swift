//
//  MoviesOverviewList.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import MoviesDB
import Models

@available(iOS 17.0, *)
struct MoviesOverviewList: View {

    private let navigationTitle: String
    private let title: String
    private let movies: [Watchable]
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore
    private let movieService: MediaService
    private let mediaFetcher: MediaFetcher

    init(
        navigationTitle: String,
        title: String,
        movies: [Watchable],
        favoriteMoviesDBStore: FavoriteMoviesDBStore,
        movieService: MediaService
    ) {
        self.navigationTitle = navigationTitle
        self.title = title
        self.movies = movies
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.movieService = movieService
        self.mediaFetcher = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                         service: movieService)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.title)
                    .bold()
                Spacer()
                NavigationLink(
                    destination: PaginatedListView(viewModel: PaginatedListViewModel(controller: MoviesOverviewController(popularMoviesFetcher: mediaFetcher)),
                                                   favoriteMoviesDBStore: favoriteMoviesDBStore,
                                                   movieService: movieService)
                    .navigationTitle(navigationTitle)
                ) {
                    discloseAllView
                }
            }
            .padding(.horizontal, 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(movies, id: \.id) { item in
                        MovieOverviewListItem(movie: item,
                                              favoriteMoviesDBStore: favoriteMoviesDBStore,
                                              movieService: movieService)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }

    // MARK: - Private

    private var discloseAllView: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Text(Texts.seeAll)
                .foregroundColor(.accentColor)
                .font(.title3)
                .bold()
            Icons.disclosureIndicator
                .foregroundColor(.accentColor)
                .padding(.bottom, 4)
        }
    }
}
