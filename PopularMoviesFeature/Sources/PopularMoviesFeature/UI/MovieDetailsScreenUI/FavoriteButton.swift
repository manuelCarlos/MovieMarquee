//
//  FavoriteButton.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

@available(iOS 13.0, *)
struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    var id: Int
    var title: String?

    var body: some View {
        Button {
            if isFavorite {
                // TODO
                isFavorite.toggle()
            } else {
                // TODO
                isFavorite.toggle()
            }
            //            isFavorite.toggle() // TODO
        } label: {
            Image(
                systemName: isFavorite ? Icons.favoriteOn.rawValue : Icons.favoriteOff.rawValue
            )
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.red)
        }
        .onAppear {
            isFavorite = true // TODO
        }
    }
}
