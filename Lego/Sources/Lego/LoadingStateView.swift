//
//  LoadingStateView.swift
//  Lego
//
//  Created by Manuel Lopes on 21.10.24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct LoadingStateView: View {

    private let subtitle: String

    public init(subtitle: String) {
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))

            Text(subtitle)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
