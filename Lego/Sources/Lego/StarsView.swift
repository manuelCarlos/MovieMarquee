//
//  StarsView.swift
//  Lego
//
//  Created by Manuel Lopes on 28.11.24.
//


import SwiftUI

@available(iOS 13.0, *)
public struct StarsView: View {

    private let rating: CGFloat
    private let maxRating: Int

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
