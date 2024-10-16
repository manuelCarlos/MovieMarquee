// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoriteMoviesDB",
    products: [
        .library(
            name: "FavoriteMoviesDB",
            targets: ["FavoriteMoviesDB"])
    ],
    targets: [
        .target(
            name: "FavoriteMoviesDB"),
        .testTarget(
            name: "FavoriteMoviesDBTests",
            dependencies: ["FavoriteMoviesDB"]
        )
    ]
)
