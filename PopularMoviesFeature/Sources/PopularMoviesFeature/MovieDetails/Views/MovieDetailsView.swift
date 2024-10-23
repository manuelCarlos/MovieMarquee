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

    private let viewModel: MovieDetailsViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(viewModel: MovieDetailsViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var body: some View {
        contentView
            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            .navigationTitle(viewModel.navigationTitle)
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { await viewModel.fetchMediaDetails() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { await viewModel.fetchMediaDetails() }
            }
        case .loaded(let movieDetails):
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    DetailsView(movieDetails: movieDetails, favoriteMoviesDBStore: favoriteMoviesDBStore)

                    if let overview = movieDetails.overview {
                        Text(Texts.movieOverviewTitle)
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
}

@available(iOS 17.0, *)
private struct DetailsView: View {

    let movieDetails: WatchableDetails
    let favoriteMoviesDBStore: FavoriteMoviesDBStore

    var body: some View {
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: movieDetails.posterUrl)
                .frame(width: 150, height: 200)

            MovieDetailsHeader(
                title: movieDetails.title,
                genres: movieDetails.genres.first?.name,
                rating: movieDetails.voteAverage,
                language: movieDetails.originalLanguage,
                date: (movieDetails as? MovieDetails)?.releaseDate,
                time: (movieDetails as? MovieDetails)?.localizedRuntime
            )

            FavoriteButton(
                mediaId: movieDetails.id,
                mediaTitle: movieDetails.title,
                favoriteMoviesDBStore: favoriteMoviesDBStore
            )
            .padding(.leading, 20)
            .padding(.trailing, 20)

            Spacer()
        }
    }
}
