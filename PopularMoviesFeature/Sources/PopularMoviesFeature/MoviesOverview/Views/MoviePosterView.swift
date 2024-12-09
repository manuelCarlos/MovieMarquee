//
//  MoviePosterView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

@available(iOS 15.0, *)
struct MoviePosterView: View {

    private let posterPlaceholder = "poster_placeholder.jpg"

    private let imageUrl: String
    private let animation: Animation

    init(imageUrl: String, animation: Animation = .easeInOut(duration: 0.1)) {
        self.imageUrl = imageUrl
        self.animation = animation
    }

    var body: some View {
        asyncImage
    }

    // MARK: - Private

    @ViewBuilder
    private var loadingImage: some View {
        if let uiImage = UIImage(named: posterPlaceholder, in: .module, with: nil) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        }
    }

    @ViewBuilder
    private var asyncImage: some View {
        AsyncImage(url: URL(string: imageUrl),
                   transaction: Transaction(animation: .default)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .empty:
                loadingImage
            case .failure:
                Icons.moviePosterFailure
                    .foregroundColor(.gray)
                    .opacity(0.5)
            @unknown default:
                ProgressView()
            }
        }
    }
}
