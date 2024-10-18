//
//  DiscoverSlice.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
struct DiscoverSlice: View {

    private let navigationTitle: String
    private let sliceTitle: String
    private let sliceItems: [Watchable]
    private let section: MediaSection
    private let favoriteMoviesDBStore: FavoriteMoviesDBStore

    init(navigationTitle: String, sliceTitle: String, sliceItems: [Watchable], section: MediaSection, favoriteMoviesDBStore: FavoriteMoviesDBStore) {
        self.navigationTitle = navigationTitle
        self.sliceTitle = sliceTitle
        self.sliceItems = sliceItems
        self.section = section
        self.favoriteMoviesDBStore = favoriteMoviesDBStore
    }

    var seeAllView: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Text(Texts.ButtonTitle.sliceSeeAll)
                .foregroundColor(.accentColor)
                .font(.title3)
                .bold()
            Image(systemName: Icons.seeAllButton.rawValue)
                .foregroundColor(.accentColor)
                .padding(.bottom, 4)
        }
        .padding(.trailing, 10)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center) {
                Text(sliceTitle)
                    .font(.title)
                    .bold()
                Spacer()
                NavigationLink(
                    destination: MediaListView(viewModel: MediaListViewModel(interactor: DefaultMediaInteractor(),
                                                                             section: section),
                                               favoriteMoviesDBStore: favoriteMoviesDBStore)
                    .navigationTitle(navigationTitle)
                ) {
                    seeAllView
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(sliceItems, id: \.id) { item in
                        DiscoverSliceItem(item: item, favoriteMoviesDBStore: favoriteMoviesDBStore)
                            .frame(height: 290, alignment: .center)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
