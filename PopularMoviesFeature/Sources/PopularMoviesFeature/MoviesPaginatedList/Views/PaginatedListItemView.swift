//
//  PaginatedListItemView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

import Lego
import Models

@available(iOS 15.0, *)
struct PaginatedListItemView: View {

    private struct Layout {
        let posterMaxWidth: CGFloat = 150
        let containerHeight: CGFloat = 250
        let hStackSpacing = Spacings.space20
        let textAlignement: TextAlignment = .leading

        let titleFont: Font = .title2
        let titleScaleFactor: CGFloat = 0.7
        let titleColor: Color = .primary
        let titlePaddingBottom = Spacings.space20

        let languageFont: Font = .title3
        let languageColor: Color = .primary

        let starsMaxWidth: CGFloat = 120
        let starsFrameAlignment: Alignment = .center

        let favoriteIconSize = CGSize(width: 25, height: 25)
        let favoriteIconColor: Color = .red
    }

    private let layout = Layout()

    private let mediaItem: Watchable
    private let movieService: MediaService
    @ObservedObject private var movieDetailsViewModel: MovieDetailsViewModel

    init(mediaItem: Watchable,
         movieService: MediaService) {
        self.mediaItem = mediaItem
        self.movieService = movieService
        self.movieDetailsViewModel = MovieDetailsViewModel(controller: MovieDetailsController(movieService: movieService),
                                                           navigationTitle: mediaItem.title,
                                                           movieId: mediaItem.id)
    }

    var body: some View {
        NavigationLink(
            destination:
                MovieDetailsView(viewModel: movieDetailsViewModel,
                                 movieService: movieService)
        ) {
            HStack(alignment: .center, spacing: layout.hStackSpacing) {
                MoviePosterView(imageUrl: mediaItem.posterUrl)
                    .frame(maxWidth: layout.posterMaxWidth)
                movieInfoStackView
                Spacer()
            }
            .frame(height: layout.containerHeight)
        }
    }

    // MARK: - Private

    private var movieInfoStackView: some View {
        VStack(alignment: .leading) {
            Text(mediaItem.title)
                .font(layout.titleFont)
                .minimumScaleFactor(layout.titleScaleFactor)
                .foregroundColor(layout.titleColor)
                .multilineTextAlignment(layout.textAlignement)
                .padding(.bottom, layout.titlePaddingBottom)

            if let language = mediaItem.originalLanguage?.localizedString {
                Text(language)
                    .font(layout.languageFont)
                    .minimumScaleFactor(layout.titleScaleFactor)
                    .foregroundColor(layout.languageColor)
                    .multilineTextAlignment(layout.textAlignement)
            }

            if let rating = mediaItem.voteAverage {
                StarsView(rating: CGFloat(rating / 2), maxRating: 5)
                    .frame(maxWidth: layout.starsMaxWidth, alignment: layout.starsFrameAlignment)
            }
        }
    }
}
