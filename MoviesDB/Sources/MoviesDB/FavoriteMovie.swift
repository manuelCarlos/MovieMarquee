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
public final class FavoriteMovie {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var releaseDate: Date?

    public init(id: Int, name: String, releaseDate: Date? = nil) {
        self.id = id
        self.name = name
    }
}
