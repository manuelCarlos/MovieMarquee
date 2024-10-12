//
//  DiscoverSlice.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

struct DiscoverSlice: View {

    private var sliceTitle: String
    private var sliceItems: [Watchable]
    private var section: MediaSection

    init(sliceTitle: String, sliceItems: [Watchable], section: MediaSection) {
        self.sliceTitle = sliceTitle
        self.sliceItems = sliceItems
        self.section = section
    }

    var seeAllView: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Text(Texts.ButtonTitle.sliceSeeAll)
                .foregroundColor(.accentColor)
                .font(.title2)
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
                                                                             section: section))
                    .navigationTitle("All popular movies")
                ) {
                    seeAllView
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(sliceItems, id: \.id) { item in
                        DiscoverSliceItem(item: item)
                            .frame(width: 140, height: 240, alignment: .center)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
