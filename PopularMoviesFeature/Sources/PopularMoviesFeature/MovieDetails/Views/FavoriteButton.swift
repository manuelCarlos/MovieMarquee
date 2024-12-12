//
//  FavoriteButton.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
struct FavoriteButton: View {

    @State private var isFavorite: Bool?

    private let size = CGSize(width: 35, height: 35)

    private let mediaId: Int
    private let mediaTitle: String
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(mediaId: Int, mediaTitle: String, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.mediaId = mediaId
        self.mediaTitle = mediaTitle
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        Button {
            Task { [favoriteMoviesDBStore] in
                if isFavorite == true {
                    try? await favoriteMoviesDBStore.deleteMovie(with: mediaId)
                } else {
                    try? await favoriteMoviesDBStore.insertMovie(FavoriteMovie(id: mediaId, name: mediaTitle))
                }
                isFavorite?.toggle()
            }

        } label: {
            Icons.favorite(isOn: isFavorite == true)
                .resizable()
                .frame(width: size.width, height: size.height)
                .foregroundColor(.red)
        }
        .symbolEffect(.bounce, value: isFavorite == true)
        .task { [favoriteMoviesDBStore] in
            do {
                _ = try await favoriteMoviesDBStore.fetchMovie(with: mediaId)
                isFavorite = true
            } catch {
                isFavorite = false
            }
        }
    }
}
