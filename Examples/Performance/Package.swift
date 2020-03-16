// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "PerformanceCheck",
    dependencies: [
        .package(path: "../../")
    ],
    targets: [
        .target(
            name: "PerformanceCheck",
            dependencies: ["PcgRandom"]),
    ]
)
