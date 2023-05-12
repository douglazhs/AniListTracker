// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AniListService",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "AniListService",
            targets: ["AniListService"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AniListService",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "AniListServiceTests",
            dependencies: ["AniListService"]),
    ]
)
