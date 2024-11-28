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

    private let favoriteOn = "heart.fill"
    private let favoriteOff = "heart"
    private let mediaId: Int
    private let mediaTitle: String?
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(mediaId: Int, mediaTitle: String?, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.mediaId = mediaId
        self.mediaTitle = mediaTitle
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        Button {
            if isFavorite == true {
                Task { try? await favoriteMoviesDBStore.deleteMovie(with: mediaId) }
            } else {
                Task { try? await favoriteMoviesDBStore.insertMovie(FavoriteMovie(id: mediaId, name: mediaTitle!)) }
            }
            isFavorite?.toggle()

        } label: {
            Icons.favorite(isOn: isFavorite == true)
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.red)
        }
        .symbolEffect(.bounce, value: isFavorite)
        .task {
            do {
                _ = try await favoriteMoviesDBStore.fetchMovie(with: mediaId)
                isFavorite = true
            } catch {
                isFavorite = false
            }
        }
    }
}
