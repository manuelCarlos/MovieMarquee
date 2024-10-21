//
//  MovieDetailsView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import Lego
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
        case .loaded(let movieDetails):
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    makeMovieDetailsView(movieDetails: movieDetails)

                    if let overview = movieDetails.overview {
                        Text("Overview")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(overview)
                            .font(.system(size: 16))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                    }

                    MovieCastGrid(viewModel: MovieCastViewModel(controller: MovieCastController(),
                                                                mediaId: movieDetails.id))
                }
            }
        }
    }

    // MARK: - Private

    private func makeMovieDetailsView(movieDetails: WatchableDetail) -> some View { // TODO: - make this a View?
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: movieDetails.posterUrl)
                .frame(width: 150, height: 200)

            MovieDetailsHeader(
                title: movieDetails.title,
                genres: movieDetails.genres.first?.name,
                rating: movieDetails.voteAverage,
                language: movieDetails.originalLanguage,
                date: (movieDetails as? MovieDetail)?.releaseDate,
                time: (movieDetails as? MovieDetail)?.localizedRuntime
            )

            FavoriteButton(mediaId: movieDetails.id,
                           mediaTitle: movieDetails.title,
                           favoriteMoviesDBStore: favoriteMoviesDBStore)
            .padding(.leading, 20)
            .padding(.trailing, 20)

            Spacer()
        }
    }
}
