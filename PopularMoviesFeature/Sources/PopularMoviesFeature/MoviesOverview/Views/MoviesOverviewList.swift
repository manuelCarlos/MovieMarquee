//
//  MoviesOverviewList.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

import Lego
import Models

@available(iOS 15.0, *)
struct MoviesOverviewList: View {

    private struct Layout {
        let mainVStackSpacing = Spacings.zero
        let horizontalPadding = Spacings.space10
        let horizontalScrollSpacing: CGFloat = 10
        let titleFont: Font = .title
        let titleFontWeight: Font.Weight = .bold
        let seeAllFont: Font = .title3
        let seeAllSpacing = Spacings.space4
        let seeAllBottomPadding = Spacings.space4
        let seeAllColor: Color = .accentColor
    }

    private let layout = Layout()

    private let navigationTitle: String
    private let title: String
    private let movies: [Watchable]
    private let movieService: MediaService
    private let mediaFetcher: MediaFetcher

    init(
        navigationTitle: String,
        title: String,
        movies: [Watchable],
        movieService: MediaService
    ) {
        self.navigationTitle = navigationTitle
        self.title = title
        self.movies = movies
        self.movieService = movieService
        self.mediaFetcher = MediaFetcher(mediaListFetcher: PopularMoviesFetcher(),
                                         service: movieService)
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: layout.mainVStackSpacing) {
                HStack(alignment: .center) {
                    Text(title)
                        .font(layout.titleFont)
                        .bold()

                    Spacer()

                    NavigationLink(destination: {
                        PaginatedListView(viewModel: PaginatedListViewModel(controller: MoviesOverviewController(popularMoviesFetcher: mediaFetcher)),
                                          movieService: movieService)
                        .navigationTitle(navigationTitle)
                    }, label: { discloseAllView })
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: layout.horizontalScrollSpacing) {
                        ForEach(movies, id: \.id) { item in
                            MovieOverviewListItem(movie: item,
                                                  movieService: movieService)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, layout.horizontalPadding)
    }

    // MARK: - Private

    private var discloseAllView: some View {
        HStack(alignment: .bottom, spacing: layout.seeAllSpacing) {
            Text(Texts.seeAll)
                .foregroundColor(layout.seeAllColor)
                .font(layout.seeAllFont)
                .bold()
            Icons.disclosureIndicator
                .foregroundColor(layout.seeAllColor)
                .padding(.bottom, layout.seeAllBottomPadding)
        }
    }
}
