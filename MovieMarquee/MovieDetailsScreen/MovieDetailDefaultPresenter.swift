final class MovieDetailDefaultPresenter: @unchecked Sendable, MovieDetailPresenter {
    let interactor: MovieDetailInteractor
    @Published var media: MovieDetail?
    let id: Int

    init(interactor: MovieDetailInteractor, id: Int) {
        self.interactor = interactor
        self.id = id
    }

    func getMediaDetail() async {
        do {
            guard let movieDetail = try await interactor.getMovieDetail(id) else {
                return
            }
            guard let detail = movieDetail as? MovieDetail else {
                return
            }
            self.media = detail
        } catch {

        }
    }
}
