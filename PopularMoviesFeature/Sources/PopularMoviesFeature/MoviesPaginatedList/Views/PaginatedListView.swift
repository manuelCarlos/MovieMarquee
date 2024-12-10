//
//  PaginatedListView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

import Lego

@available(iOS 15.0, *)
struct PaginatedListView: View {

    @ObservedObject private var viewModel: PaginatedListViewModel
    private let movieService: MediaService

    init(viewModel: PaginatedListViewModel,
         movieService: MediaService) {
        self.viewModel = viewModel
        self.movieService = movieService
    }

    var body: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { await viewModel.fetchFirstPage() }
            }
        case .loaded(let watchables):
            ScrollView {
                LazyVStack(alignment: .center, spacing: Spacings.space10) {
                    ForEach(watchables, id: \.id) { watchable in
                        PaginatedListItemView(mediaItem: watchable,
                                              movieService: movieService)
                        .padding(.horizontal, Spacings.space20)
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
