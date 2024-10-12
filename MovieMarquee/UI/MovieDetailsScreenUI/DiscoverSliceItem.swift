//
//  DiscoverSliceItem.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Models

struct DiscoverSliceItem: View {

    private var item: Watchable

    init(item: Watchable) {
        self.item = item
    }

    var body: some View {
        NavigationLink(
            destination: makeMovieDetailView(mediaType: type(of: item))
        ) {
            VStack {
                MoviePosterView(imageUrl: item.posterUrl,
                                animation: .easeInOut(duration: 0.3))
                .scaledToFit()
                .frame(width: 140, height: 210)
            }
            .border(
                Color.primary,
                width: 1
            )
        }
    }

    // MARK: - Private

    private func makeMovieDetailView(mediaType: Watchable.Type) -> some View {
        VStack {
            if mediaType == Movie.self {
                MovieDetailView(
                    presenter: MovieDetailDefaultPresenter(
                        interactor: DefaultMovieDetailInteractor(),
                        id: item.id
                    )
                )
            }
        }
    }
}