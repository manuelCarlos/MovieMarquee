//
//  FavoriteMovie.swift
//  MoviesDB
//
//  Created by Manuel Lopes on 16.10.24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
final class FavoriteMovie {
    @Attribute(.unique)
    var id: Int
    var name: String
    var releaseDate: Date?

    init(id: Int, name: String, releaseDate: Date? = nil) {
        self.id = id
        self.name = name
    }
}
