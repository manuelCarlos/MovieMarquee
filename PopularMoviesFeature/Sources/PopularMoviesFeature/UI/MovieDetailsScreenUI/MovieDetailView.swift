//
//  MovieDetailView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Models

@available(iOS 17.0, *)
struct MovieDetailView: View {

    @State private var viewModel: MovieDetailViewModel
    @State private var isFavorite = false

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        contentView
            .navigationTitle(viewModel.navigationTitle)
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleStateView {
                Task { await viewModel.fetchMediaDetail() }
            }
        case .loading:
            LoadingStateView(subtitle: "Loading...")
        case .failed(let error):
            FailedStateView(error: error) {
                Task { await viewModel.fetchMediaDetail() }
            }
        case .loaded(let mediaDetail):
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            makeMediaDetailsView(mediaDetails: mediaDetail)
                                .frame(width: geometry.size.width, alignment: .top)
                            if let overview = mediaDetail.overview {
                                Text("Overview")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(overview)
                                    .font(.system(size: 16))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                            }
                     
                            MediaCastGrid(viewModel: MediaCastViewModel(interactor: DefaultMediaCastInteractor(mediaService: MovieService.shared),
                                                                        mediaId: mediaDetail.id))
                        }
                    }
                    .padding()
                }
            }
        }
    }

    // MARK: - Private

    private func makeMediaDetailsView(mediaDetails: WatchableDetail) -> some View {
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: mediaDetails.posterUrl)
                .frame(width: 150, height: 200)

            MediaDetailHeader(
                title: mediaDetails.title,
                genres: mediaDetails.genres.first?.name,
                rating: mediaDetails.voteAverage,
                language: mediaDetails.originalLanguage,
                date: (mediaDetails as? MovieDetail)?.releaseDate,
                time: (mediaDetails as? MovieDetail)?.localizedRuntime
            )

            FavoriteButton(isFavorite: $isFavorite,
                           id: mediaDetails.id,
                           title: mediaDetails.title)
                .padding()

            Spacer()
        }
    }
}
