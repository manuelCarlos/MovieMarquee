import SwiftUI

@MainActor
struct MediaListView: View {

    @ObservedObject var presenter: MediaListDefaultPresenter

    init(mediaListPresenter: MediaListDefaultPresenter) {
        self.presenter = mediaListPresenter
        self.presenter.fetchMedia()
    }

    var body: some View {

        ScrollView {
            LazyVStack(alignment: .center, spacing: 10) {
                ForEach(self.presenter.mediaList, id: \.id) { media in
                    MediaListItemView(mediaListItem: media)
                        .padding(.horizontal, 20)
                }
                Spacer()
                    .onAppear(perform: {
                        presenter.fetchMedia()
                    })
            }

        }
    }
}