//
//  MovieOverviewListItem.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Models
import MoviesDB

@available(iOS 17.0, *)
struct MovieOverviewListItem: View {

    private let movie: Watchable
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(movie: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.movie = movie
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        NavigationLink(
            destination: makeMovieDetailView(mediaType: type(of: movie))
        ) {
            VStack {
                MoviePosterView(imageUrl: movie.posterUrl,
                                animation: .easeInOut(duration: 0.3))
                .scaledToFit()
                .frame(width: 140, height: 210)

                Text(movie.title)
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
                MovieDetailsView(viewModel: MovieDetailsViewModel(controller: MovieDetailsController(),
                                                                  navigationTitle: movie.title,
                                                                  movieId: movie.id),
                                 favoriteMoviesDBStore: favoriteMoviesDBStore)
            }
        }
    }
}
