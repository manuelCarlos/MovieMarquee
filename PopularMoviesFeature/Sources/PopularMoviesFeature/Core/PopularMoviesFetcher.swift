import Foundation

public final class PopularMoviesFetcher: Sendable, MediaListFetcher {

    public init() {}

    public func fetch(page: Int) -> NetworkRequest {
        MovieRequest.getPopularMovies(page: page)
    }
}
