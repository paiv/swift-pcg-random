// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PcgRandom",
    platforms: [.iOS(.v11), .macOS(.v10_10), .watchOS(.v2)],
    products: [
        .library(
            name: "PcgRandom",
            targets: ["PcgRandom"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gongzhang/UInt128.git", .revision("152e314855f722806a898d0f55a038efc564f13f")),
    ],
    targets: [
        .target(
            name: "PcgRandom",
            dependencies: [
                .byNameItem(name: "PcgRandomC", condition: .when(platforms: [.macOS, .iOS])),
                .byNameItem(name: "UInt128", condition: .when(platforms: [.watchOS])),
            ]),
        .target(
            name: "PcgRandomC",
            dependencies: []),
        .testTarget(
            name: "PcgRandomTests",
            dependencies: ["PcgRandom"]),
    ],
    swiftLanguageVersions: [.v5]
)
