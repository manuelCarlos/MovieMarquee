//
//  ArtistItemView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import SwiftUI

import Models

@available(iOS 15.0, *)
struct ArtistItemView: View {

    private let artist: Creditable
    private let width: CGFloat = 110

    init(artist: Creditable) {
        self.artist = artist
    }

    var body: some View {
        VStack(alignment: .center) {
            artistImage
            artistTitle
        }
        .cornerRadius(10)
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
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue.opacity(0.6)))
                case .failure:
                    failureView
                @unknown default:
                    unknownPhaseView
                }
            }
            .frame(width: width, height: 150)
        } else {
            failureView
        }
    }

    @ViewBuilder
    private var artistTitle: some View {
        if let title = artist.titleString {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.7)
                .frame(width: width, height: 50, alignment: .top)
        }
    }

    @ViewBuilder
    private var failureView: some View {
        VStack {
            Text("Unavailble")
                .foregroundColor(.gray)
                .font(.caption)
                .lineLimit(2)
                .padding(.top, 10)
                .padding(.leading, 10)
                .padding(.trailing, 10)

            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .opacity(0.3)
                .padding()
                .frame(width: width, height: 130)
        }
    }

    @ViewBuilder
    private var unknownPhaseView: some View {
        let _ = assertionFailure("Unknown image loading phase") // swiftlint:disable:this redundant_discardable_let
        EmptyView()
    }
}
