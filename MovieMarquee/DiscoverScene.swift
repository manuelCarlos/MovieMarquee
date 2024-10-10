//
//  DiscoverScene.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

struct DiscoverScene: View {

    @State private var viewModel: DiscoverSceneViewModel

    init(viewModel: DiscoverSceneViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            contentView
        }
        .navigationBarTitle(Texts.NavigationBarTitle.discoverScreen)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .padding(
            EdgeInsets(
                top: 5,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
        )
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                viewModel.fetchMedia()
            }
        case .loading:
            LoadingStateView()
        case .failed(let error):
            FailedStateView(error: error) {
                viewModel.fetchMedia()
            }
        case .loaded(let popularMovies):
            LoadedStateView(popularMovies: popularMovies)
        }
    }

    private struct LoadedStateView: View {
        let popularMovies: [Watchable]

        var body: some View {
            DiscoverSlice(
                sliceTitle: Texts.SectionHeader.mostPopular,
                sliceItems: popularMovies,
                section: MediaSection.popularMovies
            )
        }
    }
}

private struct IdleStateView: View {
    let onAppear: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Loading...")
        }
        .task {
            onAppear()
        }
    }
}

private struct LoadingStateView: View {
    var body: some View {
        ProgressView()
    }
}

private struct FailedStateView: View {
    let error: Error
    let onRetry: () async -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Oops, something went wrong")
        } description: {
            Text("Error: \(error.localizedDescription)")
        } actions: {
            Button {
                Task {
                    await onRetry()
                }
            } label: {
                Text("Retry")
                    .font(.title)
            }
        }
    }
}
