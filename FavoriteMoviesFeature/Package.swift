// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoriteMoviesFeature",
    defaultLocalization: "en",
    products: [
        .library(
            name: "FavoriteMoviesFeature",
            targets: ["FavoriteMoviesFeature"])
    ],
    dependencies: [
        .package(path: "MoviesDB"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.0")
    ],
    targets: [
        .target(
            name: "FavoriteMoviesFeature",
            dependencies: [
                .product(name: "MoviesDB", package: "MoviesDB")
            ]
        ),
        .testTarget(
            name: "FavoriteMoviesFeatureTests",
            dependencies: [
                "FavoriteMoviesFeature",
                "MoviesDB",
                .product(name: "MoviesDBMocks", package: "MoviesDB"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
