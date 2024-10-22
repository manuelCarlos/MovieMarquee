//
//  PaginatedListViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

import Models

@available(iOS 17.0, *)
@Observable
final class PaginatedListViewModel: @unchecked Sendable {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded([Watchable])
    }

    private let controller: MediaOverviewController
    private(set) var state = State.idle

    init(controller: MediaOverviewController) {
        self.controller = controller
    }

    func fetchFirstPage() async {
        do {
            state = .loading
            try await fetchMedia(isFirstPage: true)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    func fetchMedia() async throws {
        try await fetchMedia(isFirstPage: false)
    }

    // MARK: - Private

    private func fetchMedia(isFirstPage: Bool) async throws {
        let mediaList = try await controller.fetchPopularMoviesNextPage()
        if mediaList.isEmpty && isFirstPage {
            throw MediaServiceError.noPopularMoviesAvailable
        }
        state = .loaded(mediaList)
    }
}
