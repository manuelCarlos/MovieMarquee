// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkService",
    products: [
        .library(
            name: "NetworkService",
            targets: ["NetworkService"])
    ],
    targets: [
        .target(
            name: "NetworkService"),
        .testTarget(
            name: "NetworkServiceTests",
            dependencies: ["NetworkService"],
            resources: [
                   // Copy Tests/ExampleTests/Resources directories as-is.
                   // Use to retain directory structure.
                   // Will be at top level in bundle.
                   .copy("Resources/mockedApiKey.json")
                 ]
        )
    ]
)
