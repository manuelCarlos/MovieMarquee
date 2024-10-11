//
//  MediaListViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@Observable
final class MediaListViewModel: @unchecked Sendable, MediaListPresenter {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Watchable])
    }

    let interactor: MediaInteractor
    let section: MediaSection

    private(set) var state = State.idle

    init(interactor: MediaInteractor, section: MediaSection) {
        self.interactor = interactor
        self.section = section
    }

   func fetchfirstPage() async throws {
        switch self.section {
        case .popularMovies:
            state = .loading
            try await fetchMedia()
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
