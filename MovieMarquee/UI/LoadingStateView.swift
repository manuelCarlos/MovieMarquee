//
//  LoadingStateView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

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
