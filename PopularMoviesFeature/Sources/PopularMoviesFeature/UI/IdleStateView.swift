//
//  IdleStateView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 15.0, *)
struct IdleStateView: View {
    let onAppear: () -> Void

    var body: some View {
        Color.clear
            .task {
                onAppear()
            }
    }
}
