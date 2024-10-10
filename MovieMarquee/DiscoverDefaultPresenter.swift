final class DiscoverDefaultPresenter: DiscoverPresenter {

    private(set) var interactor: MediaInteractor
    @Published var popularMovies: [Watchable]
    @Published var mostRecentMovies: [Watchable]
    @Published var upcomingMovies: [Watchable]

    @Published var fetchError: Error?

    @Published var isLoading: Bool = false

    init(_ interactor: MediaInteractor) {
        self.interactor = interactor
        self.popularMovies = [Watchable]()
        self.mostRecentMovies = [Watchable]()
        self.upcomingMovies = [Watchable]()
        self.isLoading = false
    }

    func fetchMedia() {
        isLoading = false
        Task {
            await loadPopularMovies()
        }
        isLoading = true
    }

    private func loadPopularMovies() async {
        do {
            let movies = try await interactor.fetchNextPopularPageAsFullList()
            mapToMovies(watchables: movies, container: &self.popularMovies)
        } catch {
            fetchError = FetchError.networkError
        }
    }

    private func mapToMovies(watchables: [Watchable], container: inout [Watchable]) {
        watchables.compactMap { $0 as? Movie }
            .filter { $0.releaseDate != nil }
            .forEach { container.append($0) }
    }
}