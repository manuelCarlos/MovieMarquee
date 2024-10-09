// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Models",
    products: [
        .library(
            name: "Models",
            targets: ["Models"])
    ],
    targets: [
        .target(
            name: "Models"),
        .testTarget(
            name: "ModelsTests",
            dependencies: ["Models"],
            resources: [
                   .copy("Resources/cast.json"),
                   .copy("Resources/malformed_cast.json")
                 ]
        )
    ]
)
