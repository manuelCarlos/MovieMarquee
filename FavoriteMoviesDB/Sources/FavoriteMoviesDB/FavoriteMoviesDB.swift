// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
public final class FavoriteMovie {
    @Attribute(.unique)
    public var id: Int
    public var name: String
    public var releaseDate: Date?

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
