//
//  ContentView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 04.10.24.
//

import SwiftUI

import NetworkService

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(FetchError.networkError.localizedDescription)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
