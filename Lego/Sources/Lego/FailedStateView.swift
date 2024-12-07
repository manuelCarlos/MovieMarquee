//
//  FailedStateView.swift
//  Lego
//
//  Created by Manuel Lopes on 21.10.24.
//

import SwiftUI

/// A SwiftUI view that presents a failure state with a title, description, and an optional retry action.
///
/// `FailedStateView` is used to display a message to the user when a process or operation fails.
@available(iOS 17.0, *)
public struct FailedStateView: View {

    private let title: String
    private let description: String
    private let onRetry: (() -> Void)?

    /// Initializes a new `FailedStateView` with the provided title, description, and an optional retry action.
    ///
    /// - Parameters:
    ///   - title: The title of the failure state, typically used to summarize the error.
    ///   - description: A more detailed explanation or message about the failure.
    ///   - onRetry: An optional closure that will be invoked when the retry button is tapped. Defaults to `nil`.
    public init(title: String, description: String, onRetry: (() -> Void)? = nil) {
        self.title = title
        self.description = description
        self.onRetry = onRetry
    }

    public var body: some View {
        ContentUnavailableView {
            Text(title)
        } description: {
            Text(description)
        } actions: { retryAction }
    }

    // MARK: - Private

    private var retryAction: some View {
        if onRetry == nil {
            return EmptyView() // No retry button if `onRetry` is nil.
        } else {
            return Button {
                Task {
                    onRetry?()
                }
            } label: {
                Text(Texts.FailedState.retry)
                    .font(.title)
            }
        }
    }
}
