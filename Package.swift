// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PcgRandom",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .watchOS(.v11),
    ],
    products: [
        .library(
            name: "PcgRandom",
            targets: ["PcgRandom"]),
    ],
    targets: [
        .target(
            name: "PcgRandom"),
        .testTarget(
            name: "PcgRandomTests",
            dependencies: ["PcgRandom"]),
    ],
    swiftLanguageModes: [.v6]
)
