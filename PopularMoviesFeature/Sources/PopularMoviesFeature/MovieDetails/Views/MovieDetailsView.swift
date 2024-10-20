//
//  MovieDetailsView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import Models
import MoviesDB

@available(iOS 17.0, *)
struct MovieDetailsView: View {

    @State private var viewModel: MovieDetailsViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(viewModel: MovieDetailsViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
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
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    makeMediaDetailsView(mediaDetails: mediaDetail)

                    if let overview = mediaDetail.overview {
                        Text("Overview")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(overview)
                            .font(.system(size: 16))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                    }

                    MovieCastGrid(viewModel: MovieCastViewModel(controller: MovieCastController(mediaService: MovieService.shared),
                                                                mediaId: mediaDetail.id))
                }
            }
        }
    }

    // MARK: - Private

    private func makeMediaDetailsView(mediaDetails: WatchableDetail) -> some View { // TODO: - make this a View?
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: mediaDetails.posterUrl)
                .frame(width: 150, height: 200)

            MovieDetailsHeader(
                title: mediaDetails.title,
                genres: mediaDetails.genres.first?.name,
                rating: mediaDetails.voteAverage,
                language: mediaDetails.originalLanguage,
                date: (mediaDetails as? MovieDetail)?.releaseDate,
                time: (mediaDetails as? MovieDetail)?.localizedRuntime
            )

            FavoriteButton(mediaId: mediaDetails.id,
                           title: mediaDetails.title,
                           favoriteMoviesDBStore: favoriteMoviesDBStore)
            .padding()

            Spacer()
        }
    }
}
