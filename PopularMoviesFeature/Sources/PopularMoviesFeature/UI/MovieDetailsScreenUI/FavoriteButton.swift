//
//  FavoriteButton.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
struct FavoriteButton: View {

    @State private var isFavorite: Bool?

    private let mediaId: Int
    private let title: String?
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(mediaId: Int, title: String?, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.mediaId = mediaId
        self.title = title
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        Button {
            if isFavorite == true {
                try? favoriteMoviesDBStore.deleteFavorite(id: mediaId)
            } else {
                try? favoriteMoviesDBStore.addFavorite(FavoriteMovie(id: mediaId, name: title!))
            }
            isFavorite?.toggle()

        } label: {
            Image(
                systemName: isFavorite == true ? Icons.favoriteOn.rawValue : Icons.favoriteOff.rawValue
            )
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.red)
        }
        .onAppear {
            isFavorite = favoriteMoviesDBStore.getMovie(id: mediaId) != nil
        }
    }
}
