//
//  MediaListViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable
final class MediaListViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Watchable])
    }

    private let interactor: MediaInteractor
    private let section: MediaSection

    private(set) var state = State.idle

    init(interactor: MediaInteractor, section: MediaSection) {
        self.interactor = interactor
        self.section = section
    }

    func fetchfirstPage() async {
        switch self.section {
        case .popularMovies:
            do {
                state = .loading
                try await fetchMedia(ofFirstPage: true)
            } catch {
                state = .failed(error.localizedDescription)
            }
        }
    }

    func fetchMedia() async throws {
        try await fetchMedia(ofFirstPage: false)
    }

    // MARK: - Private

    private func fetchMedia(ofFirstPage: Bool) async throws {
        switch self.section {
        case .popularMovies:
            let mediaList = try await interactor.fetchNextPopularPageAsFullList()
            if mediaList.isEmpty && ofFirstPage {
                throw NSError(domain: "com.moviemarquee.error",
                              code: 0,
                              userInfo: [NSLocalizedDescriptionKey: "There are no popular movies available."])

            } else {
                state = .loaded(mediaList)
            }
        }
    }
}
