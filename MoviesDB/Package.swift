// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesDB",
    defaultLocalization: "en",
    products: [
        .library(
            name: "MoviesDB",
            targets: ["MoviesDB"]
        ),
        .library(
            name: "MoviesDBMocks",
            targets: ["MoviesDBMocks"]
        )
    ],
    targets: [
        .target(
            name: "MoviesDB"),
        .target(
            name: "MoviesDBMocks",
            dependencies: ["MoviesDB"]
        ),
        .testTarget(
            name: "MoviesDBTests",
            dependencies: ["MoviesDB", "MoviesDBMocks"]
        )
    ]
)
