struct MediaListItemView: View {

    var mediaListItem: Watchable

    internal init(mediaListItem: Watchable) {
        self.mediaListItem = mediaListItem
    }

    @ViewBuilder
    private var movieInfoStackView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(self.mediaListItem.title)
                .font(.title3)
                .minimumScaleFactor(0.7)
                .bold()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)

            if let originalLanguage = self.mediaListItem.originalLanguage?.language {
                Text(originalLanguage)
                    .font(.title3)
                    .minimumScaleFactor(0.7)
                    .bold()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }

            if let rating = self.mediaListItem.voteAverage {
                StarsView(rating: CGFloat(rating/2), maxRating: 5)
                    .frame(width: 100, alignment: .center)
            }
        }
    }

    //    @MainActor
    //    func getMediaDetailView(mediaType: Watchable.Type) -> some View {
    //        VStack {
    //            if (mediaType as? Movie.Type) != nil {
    //                MovieDetailView(
    //                    presenter: MovieDetailDefaultPresenter(
    //                        interactor: DefaultMovieDetailInteractor(),
    //                        id: self.mediaListItem.id
    //                    )
    //                )
    //            } else {
    //                TVSerieDetailView(
    //                    presenter: TVSerieDetailDefaultPresenter(
    //                        interactor: DefaultTVSerieDetailInteractor(),
    //                        id: self.mediaListItem.id
    //                    )
    //                )
    //            }
    //        }
    //    }

    var body: some View {
        NavigationLink(
            destination:
                Text("Detail") // TODO: - just do it
            //                getMediaDetailView(mediaType: type(of: mediaListItem))
        ) {
            HStack(alignment: .center, spacing: 20) {
                MoviePosterView(item: mediaListItem)
                    .frame(maxWidth: 150)
                movieInfoStackView
                Spacer()
            }
            .frame(height: 250)
        }
    }
}