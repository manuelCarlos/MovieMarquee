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

    init(
        navigationTitle: String,
        title: String,
        movies: [Watchable],
        favoriteMoviesDBStore: FavoriteMoviesDBStore
    ) {
        self.navigationTitle = navigationTitle
        self.title = title
        self.movies = movies
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.title)
                    .bold()
                Spacer()
                NavigationLink(
                    destination: PaginatedListView(viewModel: PaginatedListViewModel(controller: MoviesOverviewController()),
                                                   favoriteMoviesDBStore: favoriteMoviesDBStore)
                    .navigationTitle(navigationTitle)
                ) {
                    discloseAllView
                }
            }
            .padding(.horizontal, 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(movies, id: \.id) { item in
                        MovieOverviewListItem(movie: item, favoriteMoviesDBStore: favoriteMoviesDBStore)
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
