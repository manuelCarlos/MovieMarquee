//
//  DiscoverSliceItem.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import Models
import MoviesDB

@available(iOS 17.0, *)
struct DiscoverSliceItem: View {

    private let item: Watchable
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(item: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.item = item
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        NavigationLink(
            destination: makeMovieDetailView(mediaType: type(of: item))
        ) {
            VStack {
                MoviePosterView(imageUrl: item.posterUrl,
                                animation: .easeInOut(duration: 0.3))
                .scaledToFit()
                .frame(width: 140, height: 210)

                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .frame(width: 140, height: 60)
            }
            .cornerRadius(10)
        }
    }

    // MARK: - Private

    private func makeMovieDetailView(mediaType: Watchable.Type) -> some View {
        VStack {
            if mediaType == Movie.self {
                MovieDetailView(viewModel: MovieDetailViewModel(interactor: DefaultMediaDetailInteractor(),
                                                                navigationTitle: item.title,
                                                                movieId: item.id),
                                favoriteMoviesDBStore: favoriteMoviesDBStore)
            }
        }
    }
}
