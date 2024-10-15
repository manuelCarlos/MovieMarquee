//
//  Cast+Creditable.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 14.10.24.
//

import Models

extension Cast: Creditable {

    func getTitle() -> String {
        return title ?? originalTitle ?? originalName ?? ""
    }

    func getImagePath() -> String {
        return posterPath ?? profilePath ?? ""
    }

    func getRole() -> String {
        return character ?? job ?? department?.rawValue ?? ""
    }
}
