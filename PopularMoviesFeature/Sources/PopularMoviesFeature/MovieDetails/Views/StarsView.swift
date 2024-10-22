//
//  StarsView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 13.0, *)
struct StarsView: View {

    private let rating: CGFloat
    private let maxRating: Int

    init(rating: CGFloat, maxRating: Int) {
        self.rating = rating
        self.maxRating = maxRating
    }

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0 ..< maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { geometry in
                if geometry.size.width > 0,
                   geometry.size.width.isNaN == false,
                   geometry.size.width.isFinite,
                   maxRating > 0,
                   rating.isFinite {
                    let width = rating / CGFloat(maxRating) * geometry.size.width
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: width)
                            .foregroundColor(.yellow)
                    }
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}
