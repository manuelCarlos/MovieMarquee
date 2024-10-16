//
//  DiscoverSliceItem.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import Models

@available(iOS 17.0, *)
struct DiscoverSliceItem: View {
    
    private var item: Watchable
    private let modelContext: ModelContext

    init(item: Watchable, modelContext: ModelContext) {
        self.item = item
        self.modelContext = modelContext
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
            .cornerRadius(10)
        }
    }
    
    // MARK: - Private
    
    private func makeMovieDetailView(mediaType: Watchable.Type) -> some View {
        VStack {
            if mediaType == Movie.self {
                MovieDetailView(viewModel: MovieDetailViewModel(interactor: DefaultMediaDetailInteractor(),
                                                                navigationTitle: item.title,
                                                                movieId: item.id),
                                modelContext: modelContext)
            }
        }
    }
}
