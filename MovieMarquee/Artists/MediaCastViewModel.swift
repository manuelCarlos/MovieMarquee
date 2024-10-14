//
//  MediaCastViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//

import Foundation

import Models

@Observable
final class MediaCastViewModel: @unchecked Sendable {

    enum State {
        case idle
        case failed
        case loaded([Cast])
    }

    private(set) var interactor: MediaCastInteractor
    private let mediaId: Int
    private(set) var state: State = .idle

    init(interactor: MediaCastInteractor, mediaId: Int) {
        self.interactor = interactor
        self.mediaId = mediaId
    }

    func loadArtists() async {
        do {
            let artists = try await interactor.fetchCast(mediaId)
            state = artists.isEmpty ? .failed : .loaded(artists)
        } catch {
            state = .failed
        }
    }
}
