//
//  MediaCastGrid.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//

import SwiftUI

struct MediaCastGrid: View {

    @State private var presenter: MediaCastDefaultPresenter

    init(presenter: MediaCastDefaultPresenter) {
        self.presenter = presenter
    }

    var body: some View {
        Text("Cast")
            .font(.title)
            .fontWeight(.bold)
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .center, spacing: 20) {
            ForEach(presenter.artists, id: \.id) { artist in
                ArtistItemView(artist: artist)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        .task {
            await presenter.loadArtists()
        }
    }
}
