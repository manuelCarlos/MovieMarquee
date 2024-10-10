//
//  MoviePosterView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

struct MoviePosterView: View {

    let item: Watchable

    var body: some View {
        AsyncImage(url: URL(string: item.posterUrl)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .border(.secondary, width: 1)
            case .failure, .empty:
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.1)
            @unknown default:
                ProgressView()
            }
        }
    }
}