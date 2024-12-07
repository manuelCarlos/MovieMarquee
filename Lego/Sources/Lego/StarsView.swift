//
//  StarsView.swift
//  Lego
//
//  Created by Manuel Lopes on 28.11.24.
//

import SwiftUI

/// A SwiftUI view that visually represents a rating with stars, with support for fractional ratings.
@available(iOS 13.0, *)
public struct StarsView: View {

    /// The rating to display, which can be a fractional number between 0 and the `maxRating`.
    private let rating: CGFloat

    /// The maximum rating value (e.g., 5 stars).
    private let maxRating: Int

    /// Initializes a new `StarsView` with a specified rating and maximum rating.  A valid instance is created if the rating and maximum rating are valid.
    /// The `rating` must be a finite number within the valid range, and the `maxRating` must be greater than 0.
    ///
    /// - Parameters:
    ///   - rating: The rating to be displayed, which should be a value between 0 and `maxRating`.
    ///   - maxRating: The maximum possible rating (e.g., 5 stars). Must be greater than 0.
    public init?(rating: CGFloat, maxRating: Int) {
        guard rating.isNaN == false, rating.isFinite, rating >= 0, rating <= CGFloat(maxRating), maxRating > 0 else {
            return nil
        }
        self.rating = rating
        self.maxRating = maxRating
    }

    public var body: some View {
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
                   geometry.size.width.isFinite {
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
