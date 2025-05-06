// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "PerformanceCheck",
    platforms: [
        .macOS(.v15),
    ],
    dependencies: [
        .package(path: "../../")
    ],
    targets: [
        .executableTarget(
            name: "PerformanceCheck",
            dependencies: [
                .product(name: "PcgRandom", package: "swift-pcg-random"),
            ]),
    ]
)
