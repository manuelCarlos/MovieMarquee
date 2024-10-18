//
//  MediaListItemView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftData
import SwiftUI

import Models
import MoviesDB

@available(iOS 17.0, *)
struct MediaListItemView: View {

    private let mediaItem: Watchable
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(mediaItem: Watchable, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.mediaItem = mediaItem
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        NavigationLink(
            destination:
                makeMediaDetailView(mediaType: type(of: mediaItem))
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
        VStack(alignment: .leading, spacing: 5) {
            Text(self.mediaItem.title)
                .font(.title3)
                .minimumScaleFactor(0.7)
                .bold()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)

            if let originalLanguage = mediaItem.originalLanguage?.language {
                Text(originalLanguage)
                    .font(.title3)
                    .minimumScaleFactor(0.7)
                    .bold()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
            }

            if let rating = self.mediaItem.voteAverage {
                StarsView(rating: CGFloat(rating/2), maxRating: 5)
                    .frame(width: 100, alignment: .center)
            }
        }
    }

    private func makeMediaDetailView(mediaType: Watchable.Type) -> some View {
        VStack {
            if (mediaType as? Movie.Type) != nil {
                MovieDetailView(viewModel: MovieDetailViewModel(interactor: DefaultMediaDetailInteractor(),
                                                                navigationTitle: mediaItem.title,
                                                                movieId: mediaItem.id),
                                favoriteMoviesDBStore: favoriteMoviesDBStore)
            }
        }
    }
}
