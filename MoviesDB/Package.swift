// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesDB",
    defaultLocalization: "en",
    products: [
        .library(
            name: "MoviesDB",
            targets: ["MoviesDB"])
    ],
    targets: [
        .target(
            name: "MoviesDB"),
        .testTarget(
            name: "MoviesDBTests",
            dependencies: ["MoviesDB"]
        )
    ]
)
