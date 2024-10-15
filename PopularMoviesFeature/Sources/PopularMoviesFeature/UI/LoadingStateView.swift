//
//  LoadingStateView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 14.0, *)
struct LoadingStateView: View {

    let subtitle: String

    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))

            Text(subtitle)
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}
