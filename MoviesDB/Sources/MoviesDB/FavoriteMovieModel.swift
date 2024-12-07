//
//  FavoriteMovieModel.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
final class FavoriteMovieModel {
    @Attribute(.unique)
    var id: Int
    var name: String
    var releaseDate: Date?

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
