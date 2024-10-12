protocol MovieDetailPresenter: ObservableObject {
    var id: Int { get }
    var interactor: MovieDetailInteractor { get }
    var media: MovieDetail? { get }

    func getMediaDetail() async
}
