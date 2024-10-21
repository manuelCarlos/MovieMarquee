// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lego",
    defaultLocalization: "en",
    products: [
        .library(
            name: "Lego",
            targets: ["Lego"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.0")
    ],
    targets: [
        .target(
            name: "Lego"),
        .testTarget(
            name: "LegoTests",
            dependencies: [
                "Lego",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
