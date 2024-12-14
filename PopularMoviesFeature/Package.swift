// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopularMoviesFeature",
    defaultLocalization: "en",
    products: [
        .library(
            name: "PopularMoviesFeature",
            targets: ["PopularMoviesFeature"])
    ],
    dependencies: [
        .package(path: "NetworkService"),
        .package(path: "Models"),
        .package(path: "Lego"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.0")
    ],
    targets: [
        .target(
            name: "PopularMoviesFeature",
            dependencies: [
                .product(name: "NetworkService", package: "NetworkService"),
                .product(name: "Models", package: "Models"),
                .product(name: "Lego", package: "Lego")
            ],
            resources: [
                .process("Resources/poster_placeholder.jpg"),
                .process("Resources/uitestsJson.json")
            ]
        ),
        .testTarget(
            name: "PopularMoviesFeatureTests",
            dependencies: [
                "PopularMoviesFeature",
                "NetworkService",
                "Models",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
