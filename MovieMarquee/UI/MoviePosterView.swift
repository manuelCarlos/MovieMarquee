//
//  MoviePosterView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

struct MoviePosterView: View {

    private let imageUrl: String
    private let animation: Animation

    init(imageUrl: String, animation: Animation = .easeInOut(duration: 0.1)) {
        self.imageUrl = imageUrl
        self.animation = animation
    }

    var body: some View {
        if mockImage == false {
            AsyncImage(url: URL(string: imageUrl),
                       transaction: Transaction(animation: .default)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue.opacity(0.5)))
                        .scaleEffect(2.5)
                case .failure:
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.5)
                @unknown default:
                    ProgressView()
                }
            }
        } else {
            Image(resource: "blue-velvet-md-web", ofType: "jpg")
                .resizable()
                .scaledToFit()
        }
    }

    // MARK: - Testing purposes only

#if DEBUG
    /// Intended for testing purposes only. This initializer will load a poster image from disk instead of default remote image loading.
    private var mockImage: Bool = false
    init(imageUrl: String, animation: Animation = .easeInOut(duration: 0.1), mockImage: Bool) {
        self.imageUrl = imageUrl
        self.animation = animation
        self.mockImage = mockImage
    }
#endif
}
