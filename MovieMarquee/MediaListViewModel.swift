//
//  MediaListViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

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
                try await fetchMedia()
            } catch {
                state = .failed(error.localizedDescription)
            }
        }
    }

    func fetchMedia() async throws {
        switch self.section {
        case .popularMovies:
            let mediaList = try await interactor.fetchNextPopularPageAsFullList()
            state = .loaded(mediaList)
        }
    }
}
