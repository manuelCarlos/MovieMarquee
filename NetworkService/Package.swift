// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkService",
    defaultLocalization: "en",
    products: [
        .library(
            name: "NetworkService",
            targets: ["NetworkService"])
    ],
    dependencies: [
        .package(path: "TMDBData")
    ],
    targets: [
        .target(
            name: "NetworkService",
            dependencies: [
                .product(name: "TMDBData", package: "TMDBData")
            ]
        ),
        .testTarget(
            name: "NetworkServiceTests",
            dependencies: [
                "NetworkService",
                "TMDBData"
            ]
        )
    ]
)
