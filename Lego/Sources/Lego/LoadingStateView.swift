//
//  LoadingStateView.swift
//  Lego
//
//  Created by Manuel Lopes on 21.10.24.
//

import SwiftUI

/// A SwiftUI view that presents a loading indicator with a customizable subtitle.
@available(iOS 14.0, *)
public struct LoadingStateView: View {

    /// The subtitle text to display below the loading indicator.
    ///
    /// This string can be customized to provide context for the loading state, such as
    /// explaining what the app is currently loading or fetching.
    private let subtitle: String

    /// Initializes a new `LoadingStateView` with a subtitle.
    ///
    /// - Parameter subtitle: A string to display below the progress indicator.
    ///   This provides additional context or description of the loading state.
    public init(subtitle: String) {
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack(spacing: Spacings.space16) {
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
