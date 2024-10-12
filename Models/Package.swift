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
                   .process("Resources/cast.json"),
                   .process("Resources/malformed_cast.json"),
                   .process("Resources/movie.json"),
                   .process("Resources/malformed_movie.json"),
                   .process("Resources/movieDetail.json"),
                   .process("Resources/movieDetail_without_optional_attributes.json"),
                   .process("Resources/movieDetail_missing_required_attribute.json"),
                   .process("Resources/movieDetail_with_invalid_release_date_attribute.json")
                 ]
        )
    ]
)
