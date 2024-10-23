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
    private let movieDetailsViewModel: MovieDetailsViewModel

    init(movie: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.movie = movie
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.movieDetailsViewModel = MovieDetailsViewModel(controller: MovieDetailsController(),
                                                           navigationTitle: movie.title,
                                                           movieId: movie.id)
    }

    var body: some View {
        NavigationLink(
            destination:
                MovieDetailsView(viewModel: movieDetailsViewModel,
                                 favoriteMoviesDBStore: favoriteMoviesDBStore)
        ) {
            VStack {
                MoviePosterView(imageUrl: movie.posterUrl,
                                animation: .easeInOut(duration: 0.3))
                .scaledToFill()
                .frame(maxHeight: 300)

                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.5)
                    .frame(width: 120, height: 60, alignment: .top)
            }
            .cornerRadius(10)
        }
    }
}
