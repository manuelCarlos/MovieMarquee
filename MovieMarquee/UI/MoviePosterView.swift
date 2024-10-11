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
        AsyncImage(url: URL(string: item.posterUrl),
                   transaction: Transaction(animation: .default)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .border(.secondary, width: 1)
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
    }
}
