//
//  FailedStateView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

struct FailedStateView: View {
    let error: String
    let onRetry: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Oops, something went wrong")
        } description: {
            Text(error)
        } actions: {
            Button {
                Task {
                    onRetry()
                }
            } label: {
                Text("Retry")
                    .font(.title)
            }
        }
    }
}
