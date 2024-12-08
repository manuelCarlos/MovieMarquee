//
//  MovieDetailsView.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

import Lego
import Models
import MoviesDB

@available(iOS 17.0, *)
struct MovieDetailsView: View {

    private let viewModel: MovieDetailsViewModel
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore
    private let movieService: MediaService

    init(viewModel: MovieDetailsViewModel, favoriteMoviesDBStore: FavoriteMoviesDBStore, movieService: MediaService) {
        self.viewModel = viewModel
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
        self.movieService = movieService
    }

    var body: some View {
        contentView
            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
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
                VStack(alignment: .leading, spacing: 16) {
                    MovieTitle(title: movieDetails.title)

                    DetailsView(movieDetails: movieDetails, favoriteMoviesDBStore: favoriteMoviesDBStore)

                    Overview(description: movieDetails.overview)

                    MovieCastGrid(viewModel: MovieCastViewModel(controller: MovieCastController(movieService: movieService),
                                                                mediaId: movieDetails.id))
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }
}

@available(iOS 17.0, *)
private struct DetailsView: View {

    let movieDetails: WatchableDetails
    let favoriteMoviesDBStore: FavoriteMoviesDBStore

    var body: some View {
        HStack(alignment: .bottom) {
            MoviePosterView(imageUrl: movieDetails.posterUrl)
                .frame(width: 150, height: 200)
                .background(.gray)
                .border(.gray, width: 5)
                .cornerRadius(10)

            MovieDetailsHeader(
                genres: movieDetails.genres.first?.name,
                rating: movieDetails.voteAverage,
                language: movieDetails.originalLanguage,
                date: (movieDetails as? MovieDetails)?.dateOfRelease,
                time: (movieDetails as? MovieDetails)?.localizedRuntime
            )

            FavoriteButton(
                mediaId: movieDetails.id,
                mediaTitle: movieDetails.title,
                favoriteMoviesDBStore: favoriteMoviesDBStore
            )
        }
    }
}

@available(iOS 17.0, *)
private struct Overview: View {

    let description: String?

    var body: some View {
        if let description {
            VStack(alignment: .leading, spacing: 8) {
                Text(Texts.movieOverviewTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(description)
                    .font(.system(size: 16))
            }
        }
    }
}

@available(iOS 17.0, *)
private struct MovieTitle: View {

    let title: String

    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
    }
}
