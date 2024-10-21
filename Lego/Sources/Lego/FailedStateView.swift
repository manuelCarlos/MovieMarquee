//
//  FailedStateView.swift
//  Lego
//
//  Created by Manuel Lopes on 21.10.24.
//

import SwiftUI

@available(iOS 17.0, *)
public struct FailedStateView: View {

    private let title: String
    private let description: String
    private let onRetry: (() -> Void)?

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
            return EmptyView()
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
