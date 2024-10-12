//
//  MovieDetailView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

struct MovieDetailView: View {

    @ObservedObject var presenter: MovieDetailDefaultPresenter
    @State var isFavorite = false

    init(presenter: MovieDetailDefaultPresenter) {
        self.presenter = presenter
    }

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        mediaView()
                            .frame(width: geometry.size.width, alignment: .top)
                        if let overview = presenter.media?.overview {

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
        .navigationTitle(presenter.media?.title ?? "") // TODO: - fix
        .onAppear {
            Task {
                await presenter.getMediaDetail()
            }
        }
    }


    private func mediaView() -> some View {
        HStack(alignment: .top) {
            MoviePosterView(imageUrl: presenter.media?.posterUrl ?? "")
                .frame(width: 150, height: 200)
            MediaDetailsView(
                title: presenter.media?.title,
                genres: presenter.media?.genres.first?.name,
                rating: presenter.media?.voteAverage,
                language: presenter.media?.originalLanguage,
                date: presenter.media?.releaseDate,
                time: nil
            )

            FavoriteButton(isFavorite: $isFavorite,
                           id: presenter.id,
                           title: presenter.media?.title)
            .padding()
            Spacer()
        }
    }
}
