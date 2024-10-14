
@MainActor
protocol MediaCastPresenter: ObservableObject {
    var id: Int { get }
    var interactor: MediaCastInteractor { get }
    var artists: [Cast] { get }

    func loadArtists() async
}

final class MediaCastDefaultPresenter: MediaCastPresenter {
    private(set) var interactor: MediaCastInteractor
    @Published var artists: [Cast]
    var id: Int

    init(_ interactor: MediaCastInteractor, id: Int) {
        self.id = id
        self.interactor = interactor
        self.artists = [Cast]()
    }

    func loadArtists() async {
        self.artists = (try? await interactor.fetchCast(self.id)) ?? []
    }
}
