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
            artistImage()
            artistTitle()
        }
        .cornerRadius(10)
    }

    // MARK: - Private

    private func artistImage() -> some View {
        AsyncImage(url: URL(string: artist.posterUrl),
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
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .padding()
                Text("Unavailble")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .lineLimit(1)
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: width, height: 150)
        .clipped()
    }

    private func artistTitle() -> some View {
        Text(artist.titleString)
            .font(.headline)
            .foregroundColor(.primary)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.7)
            .frame(width: width, height: 50)
    }
}
