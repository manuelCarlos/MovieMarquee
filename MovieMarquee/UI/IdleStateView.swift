//
//  IdleStateView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

struct IdleStateView: View {
    let onAppear: () -> Void

    var body: some View {
        Color.clear
            .task {
                onAppear()
            }
    }
}
