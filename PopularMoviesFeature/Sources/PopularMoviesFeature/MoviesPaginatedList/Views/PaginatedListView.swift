//
//  PaginatedListView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

import Lego
import MoviesDB

@available(iOS 17.0, *)
struct PaginatedListView: View {

    private let viewModel: PaginatedListViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore
    private let movieService: MediaService

    init(viewModel: PaginatedListViewModel,
         favoriteMoviesDBStore: FavoriteMoviesDBStore,
         movieService: MediaService) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.movieService = movieService
    }

    var body: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { [viewModel] in await viewModel.fetchFirstPage() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { [viewModel] in await viewModel.fetchFirstPage() }
            }
        case .loaded(let watchables):
            ScrollView {
                LazyVStack(alignment: .center, spacing: Spacings.space10) {
                    ForEach(watchables, id: \.id) { watchable in
                        PaginatedListItemView(mediaItem: watchable,
                                              favoriteMoviesDBStore: favoriteMoviesDBStore,
                                              movieService: movieService)
                        .padding(.horizontal, Spacings.space20)
                    }
                    Spacer()
                        .onAppear {
                            Task { [viewModel] in
                                // In case of error, this fails silently because there's already data on screen.
                                // Possible improvement: present a easily dismissible error message.
                                try await viewModel.fetchMedia()
                            }
                        }
                }
            }
        }
    }
}
