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

    private struct Layout {
        let posterMaxHeight: CGFloat = 300
        let titleWidth: CGFloat = 120
        let titleHeight: CGFloat = 60
        let cornerRadius: CGFloat = 10
        let posterAnimation: Animation = .easeInOut(duration: 0.3)
        let movieTitleFont: Font = .headline
        let movieTitleColor: Color = .secondary
        let movieTitleScaleFactor: CGFloat = 0.5
        let movieTitleFrameAlignment: Alignment = .top
    }

    private let layout = Layout()

    private let movie: Watchable
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore
    private let movieService: MediaService

    init(movie: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore, movieService: MediaService) {
        self.movie = movie
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.movieService = movieService
    }

    var body: some View {
        NavigationLink(
            destination:
                MovieDetailsView(viewModel: MovieDetailsViewModel(controller: MovieDetailsController(movieService: movieService),
                                                                  navigationTitle: movie.title,
                                                                  movieId: movie.id),
                                 favoriteMoviesDBStore: favoriteMoviesDBStore,
                                 movieService: movieService)
        ) {
            VStack {
                MoviePosterView(imageUrl: movie.posterUrl,
                                animation: layout.posterAnimation)
                .scaledToFill()
                .frame(maxHeight: layout.posterMaxHeight)

                Text(movie.title)
                    .font(layout.movieTitleFont)
                    .foregroundColor(layout.movieTitleColor)
                    .minimumScaleFactor(layout.movieTitleScaleFactor)
                    .frame(width: layout.titleWidth,
                           height: layout.titleHeight,
                           alignment: layout.movieTitleFrameAlignment)
            }
            .cornerRadius(layout.cornerRadius)
        }
    }
}
