// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PcgRandom",
    products: [
        .library(
            name: "PcgRandom",
            targets: ["PcgRandom"]),
    ],
    targets: [
        .target(
            name: "PcgRandom",
            dependencies: ["PcgRandomC"]),
        .target(
            name: "PcgRandomC",
            dependencies: []),
        .testTarget(
            name: "PcgRandomTests",
            dependencies: ["PcgRandom"]),
    ],
    swiftLanguageVersions: [.v5]
)
