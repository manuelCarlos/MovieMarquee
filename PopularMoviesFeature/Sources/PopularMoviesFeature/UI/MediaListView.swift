//
//  MediaListView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftData
import SwiftUI

@available(iOS 17.0, *)
struct MediaListView: View {

    @State private var viewModel: MediaListViewModel
    private let modelContext: ModelContext

    init(viewModel: MediaListViewModel, modelContext: ModelContext) {
        self.viewModel = viewModel
        self.modelContext = modelContext
    }

    var body: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                Task { await viewModel.fetchfirstPage() }
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(error: error) {
                Task { await viewModel.fetchfirstPage() }
            }
        case .loaded(let mediaList):
            ScrollView {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(mediaList, id: \.id) { mediaItem in
                        MediaListItemView(mediaItem: mediaItem, modelContext: modelContext)
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
