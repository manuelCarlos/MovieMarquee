//
//  MediaListView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
struct MediaListView: View {

    @State private var viewModel: MediaListViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(viewModel: MediaListViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(error: error) {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loaded(let mediaList):
            ScrollView {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(mediaList, id: \.id) { mediaItem in
                        MediaListItemView(mediaItem: mediaItem,
                                          favoriteMoviesDBStore: favoriteMoviesDBStore)
                            .padding(.horizontal, 20)
                    }
                    Spacer()
                        .onAppear {
                            Task {
                                // In case of error, this fails silentely because there's already data on screen.
                                // Possible improvement: present a easily dismissable error message.
                                try await viewModel.fetchMedia()
                            }
                        }
                }
            }
        }
    }
}
