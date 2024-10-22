//
//  PaginatedListItemView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftData
import SwiftUI

import Models
import MoviesDB

@available(iOS 17.0, *)
struct PaginatedListItemView: View {

    @State private var isFavorite: Bool?
    private let mediaItem: Watchable
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(mediaItem: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.mediaItem = mediaItem
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        NavigationLink(
            destination:
                MovieDetailsView(viewModel: MovieDetailsViewModel(controller: MovieDetailsController(),
                                                                  navigationTitle: mediaItem.title,
                                                                  movieId: mediaItem.id),
                                 favoriteMoviesDBStore: favoriteMoviesDBStore)
        ) {
            HStack(alignment: .center, spacing: 20) {
                MoviePosterView(imageUrl: mediaItem.posterUrl)
                    .frame(maxWidth: 150)
                movieInfoStackView
                Spacer()
            }
            .frame(height: 250)
        }
    }

    // MARK: - Private

    @ViewBuilder
    private var movieInfoStackView: some View {
        VStack(alignment: .leading) {
            Text(mediaItem.title)
                .font(.title2)
                .minimumScaleFactor(0.7)
                .bold()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

            if let originalLanguage = mediaItem.originalLanguage?.language {
                Text(originalLanguage)
                    .font(.title3)
                    .minimumScaleFactor(0.7)
                    .bold()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }

            if let rating = mediaItem.voteAverage {
                StarsView(rating: CGFloat(rating/2), maxRating: 5)
                    .frame(maxWidth: 120, alignment: .center)
            }

            if favoriteMoviesDBStore.movies.contains(where: { $0.id == mediaItem.id }) == true {
                Icons.favorite(isOn: true)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
            }
        }
    }
}
