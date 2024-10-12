protocol MovieDetailInteractor: Sendable {
    func getMovieDetail(_ id: Int) async throws -> Watchable?
}
