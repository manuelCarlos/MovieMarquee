//
//  PaginatedListView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftData
import SwiftUI

import Lego
import MoviesDB

@available(iOS 17.0, *)
struct PaginatedListView: View {

    private let viewModel: PaginatedListViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(viewModel: PaginatedListViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(title: "Oops, something went wrong", description: error) {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loaded(let watchables):
            ScrollView {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(watchables, id: \.id) { watchable in
                        PaginatedListItemView(mediaItem: watchable,
                                              favoriteMoviesDBStore: favoriteMoviesDBStore)
                        .padding(.horizontal, 20)
                    }
                    Spacer()
                        .onAppear {
                            Task {
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
