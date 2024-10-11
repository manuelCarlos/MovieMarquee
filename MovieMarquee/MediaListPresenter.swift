protocol MediaListPresenter: Sendable, ObservableObject {

    var interactor: MediaInteractor { get }
    var section: MediaSection { get }
    var mediaList: [Watchable] { get set }

    func fetchMedia()
}
