// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopularMoviesFeature",
    products: [
        .library(
            name: "PopularMoviesFeature",
            targets: ["PopularMoviesFeature"])
    ],
    dependencies: [
        .package(path: "NetworkService"),
        .package(path: "Models")
    ],
    targets: [
        .target(
            name: "PopularMoviesFeature",
            dependencies: [
            .product(name: "NetworkService", package: "NetworkService"),
            .product(name: "Models", package: "Models")
        ]),

        .testTarget(
            name: "PopularMoviesFeatureTests",
            dependencies: ["PopularMoviesFeature", "NetworkService", "Models"]
        )
    ]
)
