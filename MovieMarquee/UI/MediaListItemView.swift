//
//  MediaListItemView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

struct MediaListItemView: View {

    private let mediaItem: Watchable

    init(mediaItem: Watchable) {
        self.mediaItem = mediaItem
    }

    var body: some View {
        NavigationLink(
            destination:
                getMediaDetailView()
        ) {
            HStack(alignment: .center, spacing: 20) {
                MoviePosterView(item: mediaItem)
                    .frame(maxWidth: 150)
                movieInfoStackView
                Spacer()
            }
            .frame(height: 250)
        }
    }

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

    private func getMediaDetailView() -> some View {
        VStack {
            Text("Not implemented yet") // TODO: - just do it
        }
    }
}
