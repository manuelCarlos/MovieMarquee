//
//  MovieDetailView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

// TODO: - Add state loading handling
struct MovieDetailView: View {

    @State private var viewModel: MovieDetailViewModel
    @State private var isFavorite = false

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        makeMediaDetailsView()
                            .frame(width: geometry.size.width, alignment: .top)
                        if let overview = viewModel.media?.overview {
                            Text("Overview")
                                .font(.title)
                                .fontWeight(.bold)
                            Text(overview)
                                .font(.system(size: 16))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationTitle(viewModel.media?.title ?? "") // TODO: - fix
        .onAppear {
            Task {
                await viewModel.getMediaDetail()
            }
        }
    }

    // MARK: - Private

    private func makeMediaDetailsView() -> some View {
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: viewModel.media?.posterUrl ?? "")
                .frame(width: 150, height: 200)

            MediaDetailsView(
                title: viewModel.media?.title,
                genres: viewModel.media?.genres.first?.name,
                rating: viewModel.media?.voteAverage,
                language: viewModel.media?.originalLanguage,
                date: viewModel.media?.releaseDate,
                time: nil
            )

            FavoriteButton(isFavorite: $isFavorite,
                           id: viewModel.id,
                           title: viewModel.media?.title)
            .padding()

            Spacer()
        }
    }
}
