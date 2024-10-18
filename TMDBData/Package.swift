// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDBData",
    products: [
        .library(
            name: "TMDBData",
            targets: ["TMDBData"])
    ],
    targets: [
        .target(
            name: "TMDBData",
            resources: [
                .process("Resources/apiKey.json")
            ]
        ),
        .testTarget(
            name: "TMDBDataTests",
            dependencies: ["TMDBData"],
            resources: [
                .process("Resources/mockedApiKey.json"),
                .process("Resources/invalidJSONFile.json")

            ]
        )
    ]
)
