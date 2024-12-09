//
//  ArtistItemView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import SwiftUI

import Lego
import Models

@available(iOS 15.0, *)
struct ArtistItemView: View {

    private struct Layout {
        let cornerRadius: CGFloat = 10
        let imageWidth: CGFloat = 110
        let imageHeight: CGFloat = 150
        let progressTintColor = Color.blue.opacity(0.6)

        let titleFont: Font = .headline
        let titleFontWeight: Font.Weight = .regular
        let titleForegroundColor: Color = .primary
        let titleLineLimit: Int = 2
        let titleMinimumScaleFactor: CGFloat = 0.7
        let titleWidth: CGFloat = 110
        let titleHeight: CGFloat = 50

        let failureTextColor: Color = .gray
        let failureFont: Font = .caption
        let failureLineLimit: Int = 2
        let failurePaddingTop = Spacings.space10
        let failurePaddingLeading = Spacings.space10
        let failurePaddingTrailing = Spacings.space10
        let failureImageColor: Color = .gray
        let failureImageOpacity: CGFloat = 0.3
        let failureImageHeight: CGFloat = 130
    }

    private let layout = Layout()
    private let artist: Creditable

    init(artist: Creditable) {
        self.artist = artist
    }

    var body: some View {
        VStack {
            artistImage
            artistTitle
        }
        .cornerRadius(layout.cornerRadius)
    }

    // MARK: - Private

    @ViewBuilder
    private var artistImage: some View {
        if let posterUrl = artist.posterUrl {
            AsyncImage(url: URL(string: posterUrl),
                       transaction: Transaction(animation: .default)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: layout.progressTintColor))
                case .failure:
                    failureView
                @unknown default:
                    unknownPhaseView
                }
            }
            .frame(width: layout.imageWidth, height: layout.imageHeight)
        } else {
            failureView
        }
    }

    @ViewBuilder
    private var artistTitle: some View {
        if let title = artist.titleString {
            Text(title)
                .font(layout.titleFont)
                .foregroundColor(layout.titleForegroundColor)
                .fontWeight(layout.titleFontWeight)
                .multilineTextAlignment(.center)
                .lineLimit(layout.titleLineLimit)
                .minimumScaleFactor(layout.titleMinimumScaleFactor)
                .frame(width: layout.titleWidth, height: layout.titleHeight, alignment: .top)
        }
    }

    @ViewBuilder
    private var failureView: some View {
        VStack {
            Text(Texts.unavailable)
                .foregroundColor(layout.failureTextColor)
                .font(layout.failureFont)
                .lineLimit(layout.failureLineLimit)
                .padding(.top, layout.failurePaddingTop)
                .padding(.leading, layout.failurePaddingLeading)
                .padding(.trailing, layout.failurePaddingTrailing)

            Icons.artistItemFailure
                .resizable()
                .scaledToFit()
                .foregroundColor(layout.failureImageColor)
                .opacity(layout.failureImageOpacity)
                .padding()
                .frame(width: layout.imageWidth, height: layout.failureImageHeight)
        }
    }

    @ViewBuilder
    private var unknownPhaseView: some View {
        let _ = assertionFailure("Unknown image loading phase") // swiftlint:disable:this redundant_discardable_let
        EmptyView()
    }
}
