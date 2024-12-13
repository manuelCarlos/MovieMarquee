//
//  MovieDetailsHeader.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Lego
import Models

@available(iOS 15.0, *)
struct MovieDetailsHeader: View {

    private struct Layout {
        let vStackSpacing = Spacings.space8
        let textColor: Color = .primary
        let starsViewWidth: CGFloat = 120
        let fontSubheadline: Font = .subheadline
        let fontCaption: Font = .caption
        let minimumScaleFactorText: CGFloat = 0.4
        let minimumScaleFactorLanguage: CGFloat = 0.8
        let minimumScaleFactorDate: CGFloat = 0.8
        let minimumScaleFactorTime: CGFloat = 0.8
        let maxRating = 5
    }

    private let layout = Layout()

    private let genres: String?
    private let rating: Double?
    private let originalLanguage: OriginalLanguage?
    private let date: Date?
    private let time: String?

    init(genres: String?, rating: Double?, language: OriginalLanguage?, date: Date?, time: String?) {
        self.genres = genres
        self.rating = rating
        self.originalLanguage = language
        self.date = date
        self.time = time
    }

    var body: some View {
        VStack(alignment: .leading, spacing: layout.vStackSpacing) {
            if let genres {
                Text(genres)
                    .font(layout.fontSubheadline)
                    .foregroundColor(layout.textColor)
                    .bold()
                    .minimumScaleFactor(layout.minimumScaleFactorText)
            }

            if let rating {
                StarsView(rating: CGFloat(rating / 2), maxRating: layout.maxRating)
                    .frame(width: layout.starsViewWidth, alignment: .center)
            }

            if let language = originalLanguage?.localizedString {
                Text(language)
                    .font(layout.fontSubheadline)
                    .bold()
                    .foregroundColor(layout.textColor)
                    .minimumScaleFactor(layout.minimumScaleFactorLanguage)
            }

            if let date {
                Text(date.formatted(date: .abbreviated, time: .omitted))
                    .font(layout.fontCaption)
                    .bold()
                    .foregroundColor(layout.textColor)
                    .minimumScaleFactor(layout.minimumScaleFactorDate)
            }

            if let time {
                Text(time)
                    .font(layout.fontCaption)
                    .bold()
                    .foregroundColor(layout.textColor)
                    .minimumScaleFactor(layout.minimumScaleFactorTime)
            }
        }
    }
}
