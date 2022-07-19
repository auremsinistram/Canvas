// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Canvas",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Canvas",
            targets: [
                "Canvas"
            ]
        )
    ],
    dependencies: [
        // Empty.
    ],
    targets: [
        .target(
            name: "Canvas"
        )
    ]
)
