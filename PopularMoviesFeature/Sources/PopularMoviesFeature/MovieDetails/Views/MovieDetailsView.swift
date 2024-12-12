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

    private let vStackSpacing = Spacings.space16
    private let vStackPadding = EdgeInsets(top: Spacings.space16,
                                           leading: Spacings.space16,
                                           bottom: Spacings.space16,
                                           trailing: Spacings.space16)

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
                Task { [viewModel] in await viewModel.fetchMediaDetails() }
            }
        case .loading:
            LoadingStateView(subtitle: Texts.loading)
        case .failed(let error):
            FailedStateView(title: Texts.somethingWentWrong, description: error) {
                Task { [viewModel] in await viewModel.fetchMediaDetails() }
            }
        case .loaded(let movieDetails):
            ScrollView {
                VStack(alignment: .leading, spacing: vStackSpacing) {
                    MovieTitle(title: movieDetails.title)

                    DetailsView(movieDetails: movieDetails, favoriteMoviesDBStore: favoriteMoviesDBStore)

                    Overview(description: movieDetails.overview)

                    MovieCastGrid(viewModel: MovieCastViewModel(controller: MovieCastController(movieService: movieService),
                                                                mediaId: movieDetails.id))
                }
                .padding(vStackPadding)
            }
        }
    }
}

@available(iOS 17.0, *)
private struct DetailsView: View {

    let movieDetails: WatchableDetails
    let favoriteMoviesDBStore: FavoriteMoviesDBStore

    private let size = CGSize(width: 150, height: 200)
    private let cornerRadius: CGFloat = 10
    private let borderWidth: CGFloat = 5
    private let posterBackgroundGradient = LinearGradient(colors: [.red, .indigo],
                                                          startPoint: .topLeading,
                                                          endPoint: .topTrailing)

    var body: some View {
        HStack(alignment: .bottom) {
            MoviePosterView(imageUrl: movieDetails.posterUrl)
                .frame(width: size.width, height: size.height)
                .background(posterBackgroundGradient)
                .border(posterBackgroundGradient, width: borderWidth)
                .cornerRadius(cornerRadius)

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
            VStack(alignment: .leading, spacing: Spacings.space8) {
                Text(Texts.movieOverviewTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(description)
                    .font(.system(size: Spacings.space16))
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
