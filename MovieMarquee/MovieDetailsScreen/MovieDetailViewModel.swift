//
//  MovieDetailViewModel.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation

import Models

@Observable
final class MovieDetailViewModel: @unchecked Sendable {

    private let interactor: MediaDetailInteractor
    let navigationTitle: String
    let id: Int
    private(set) var media: MovieDetail?

    init(interactor: MediaDetailInteractor, navigationTitle: String, id: Int) {
        self.interactor = interactor
        self.navigationTitle = navigationTitle
        self.id = id
    }

    func getMediaDetail() async {
        do {
            guard let movieDetail = try await interactor.getMovieDetail(id) else {
                return
            }
            guard let detail = movieDetail as? MovieDetail else {
                return
            }
            self.media = detail
        } catch {
            // TODO: - handle error
        }
    }
}
