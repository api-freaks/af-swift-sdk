// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "APIFreaks",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "APIFreaks",
            targets: ["APIFreaks"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "APIFreaks",
            path: "Sources"
        ),
        .testTarget(
            name: "APIFreaksTests",
            dependencies: ["APIFreaks"],
            path: "Tests"
        )
    ]
)
