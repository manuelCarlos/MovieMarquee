//
//  MediaListViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

import Models

@available(iOS 17.0, *)
@Observable
final class MediaListViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Movie])
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
                try await fetchMedia(isFirstPage: true)
            } catch {
                state = .failed(error.localizedDescription)
            }
        }
    }

    func fetchMedia() async throws {
        try await fetchMedia(isFirstPage: false)
    }

    // MARK: - Private

    private func fetchMedia(isFirstPage: Bool) async throws {
        switch self.section {
        case .popularMovies:
            guard let mediaList = try await interactor.fetchNextPopularPageAsFullList() as? [Movie] else {
                throw MediaFetchError.invalidData
            }

            if mediaList.isEmpty && isFirstPage {
                throw MediaFetchError.noPopularMoviesAvailable
            }

            state = .loaded(mediaList)
        }
    }
}
