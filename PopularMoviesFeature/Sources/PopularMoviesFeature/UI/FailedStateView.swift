//
//  FailedStateView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct FailedStateView: View {

    private let error: String
    private let onRetry: (() -> Void)?

    init(error: String, onRetry: (() -> Void)? = nil) {
        self.error = error
        self.onRetry = onRetry
    }

    var body: some View {
        ContentUnavailableView {
            Text("Oops, something went wrong")
        } description: {
            Text(error)
        } actions: { retryAction }
    }

    // MARK: - Private

    private var retryAction: some View {
        if onRetry == nil {
            return EmptyView()
        } else {
            return Button {
                Task {
                    onRetry?()
                }
            } label: {
                Text("Retry")
                    .font(.title)
            }
        }
    }
}
