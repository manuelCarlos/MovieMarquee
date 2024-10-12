final class DefaultMovieDetailInteractor: Sendable, MovieDetailInteractor {

    private let movieService: MediaService = MovieService.shared

    func getMovieDetail(_ id: Int) async throws -> Watchable? {
        return try await movieService.fetchMediaDetails(id: id)
    }
}
