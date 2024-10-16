//
//  MediaCastGrid.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct MediaCastGrid: View {

    @State private var viewModel: MediaCastViewModel

    init(viewModel: MediaCastViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        contentView
            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
    }

    // MARK: - Private

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                Task { await viewModel.fetchMediaCast() }
            }
        case .failed:
            // In case of error no Cast section data is displayed 😉.
            EmptyView()
        case .loaded(let artists):
            Text("Cast")
                .font(.title)
                .fontWeight(.bold)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .center, spacing: 20) {
                ForEach(artists, id: \.id) { artist in
                    ArtistItemView(artist: artist)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        }
    }
}