// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NexaLLama",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NexaLLama",
            targets: ["NexaLLama"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "NexaLLama", dependencies: [
            "common", "mtmd", "llama"
        ]),
        .binaryTarget(name: "common", path: "llama/libcommon.xcframework"),
        .binaryTarget(name: "llama", path: "llama/llama.xcframework"),
        .binaryTarget(name: "mtmd", path: "llama/libmtmd.xcframework"),
        .testTarget(
            name: "NexaLLamaTests",
            dependencies: ["NexaLLama"]
        ),
    ]
)
