protocol MediaCastInteractor {
    func fetchCast(_ id: Int) async throws -> [Cast]
}

final class DefaultMediaCastInteractor: MediaCastInteractor {
    private let mediaService: MediaService

    init(mediaService: MediaService) {
        self.mediaService = mediaService
    }

    func fetchCast(_ id: Int) async throws -> [Cast] {
        var credits: Credits?
        credits = try await mediaService.fetchMediaCredits(id: id)
        return credits?.cast ?? []
    }
}
