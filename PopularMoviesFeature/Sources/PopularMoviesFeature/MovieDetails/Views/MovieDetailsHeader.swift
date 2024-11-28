//
//  MovieDetailsHeader.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Models

@available(iOS 15.0, *)
struct MovieDetailsHeader: View {

    private let title: String?
    private let genres: String?
    private let rating: Double?
    private let language: OriginalLanguage?
    private let date: Date?
    private let time: String?

    init(title: String?, genres: String?, rating: Double?, language: OriginalLanguage?, date: Date?, time: String?) {
        self.title = title
        self.genres = genres
        self.rating = rating
        self.language = language
        self.date = date
        self.time = time
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let title {
                Text(title)
                    .font(.headline)
                    .bold()
                    .minimumScaleFactor(0.6)
            }

            if let genres {
                Text(genres)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .bold()
                    .minimumScaleFactor(0.4)
            }

            if let rating {
                StarsView(rating: CGFloat(rating / 2), maxRating: 5)
                    .frame(width: 120, alignment: .center)
            }

            if let language {
                Text(language.language)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }
            if let date {
                Text(date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }

            if let time = time {
                Text(time)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }
        }
    }
}
