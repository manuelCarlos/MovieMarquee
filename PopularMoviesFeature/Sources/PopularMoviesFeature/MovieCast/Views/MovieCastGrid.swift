//
//  MediaCastGrid.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import SwiftUI

import Lego

@available(iOS 17.0, *)
struct MovieCastGrid: View {

    private struct Layout {
        let padding = EdgeInsets(top: Spacings.space16,
                                 leading: Spacings.space16,
                                 bottom: Spacings.space16,
                                 trailing: Spacings.space16)
        let titleFont: Font = .title2
        let titleFontWeight: Font.Weight = .bold
        let titleBottomPadding = Spacings.space12
        let gridItemMinimumWidth = Spacings.space100
        let gridAlignment: HorizontalAlignment = .center
        let gridSpacing = Spacings.space20
        let transitionDuration: Double = 0.3
    }

    private let layout = Layout()
    private let viewModel: MovieCastViewModel

    init(viewModel: MovieCastViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        contentView
            .transition(.opacity.animation(.easeInOut(duration: layout.transitionDuration)))
    }

    // MARK: - Private

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            IdleView {
                Task { await viewModel.fetchMediaCast() }
            }
        case .failed:
            // In case of error, the Cast section is not displayed at all 😉.
            // Possible improvement: add error state with UI trigger to try again.
            EmptyView()
        case .loaded(let artists):
            Text(Texts.movieCastTitle)
                .font(layout.titleFont)
                .fontWeight(layout.titleFontWeight)

            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: layout.gridItemMinimumWidth))],
                alignment: layout.gridAlignment,
                spacing: layout.gridSpacing
            ) {
                ForEach(artists, id: \.id) { artist in
                    ArtistItemView(artist: artist)
                }
            }
        }
    }
}
