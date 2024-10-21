//
//  MovieCastViewModel.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import Foundation

import Models

@available(iOS 17.0, *)
@Observable
final class MovieCastViewModel: @unchecked Sendable {

    enum State {
        case idle
        case failed
        case loaded([Creditable])
    }

    private let controller: MediaCastController
    private let mediaId: Int
    private(set) var state: State = .idle

    init(controller: MediaCastController, mediaId: Int) {
        self.controller = controller
        self.mediaId = mediaId
    }

    func fetchMediaCast() async {
        do {
            let artists = try await controller.fetchCast(mediaId: mediaId)
            state = artists.isEmpty ? .failed : .loaded(artists)
        } catch {
            state = .failed
        }
    }
}
