//
//  MediaDetailHeader.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Models

struct MediaDetailHeader: View {
    var title: String?
    var genres: String?
    var rating: Double?
    var language: OriginalLanguage?
    var date: Date?
    var time: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let title {
                Text(title)
                    .font(.title2)
                    .bold()
                    .minimumScaleFactor(0.65)
            }

            if let genres {
                Text(genres)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .bold()
                    .minimumScaleFactor(0.7)
            }

            if let rating {
                StarsView(rating: CGFloat(rating / 2), maxRating: 5)
                    .frame(width: 120, alignment: .center)
            }

            if let language {
                Text(language.language)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }
            if let date {
                Text(date.formatted(date: .abbreviated, time: .omitted))
                    .font(.headline)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }

            if let time = time {
                Text(time)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.8)
            }
        }
    }
}
