// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NexaLLama",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "common",
            targets: ["common"]),
        .library(
            name: "llama",
            targets: ["llama"]),
        .library(
            name: "mtmd",
            targets: ["mtmd"]),
        .library(
            name: "nexa_bridge",
            targets: ["nexa_bridge"])
    ],
    targets: [
        .binaryTarget(name: "common", path: "llama/libcommon.xcframework"),
        .binaryTarget(name: "llama", path: "llama/llama.xcframework"),
        .binaryTarget(name: "mtmd", path: "llama/libmtmd.xcframework"),
        .binaryTarget(name: "nexa_bridge", path: "nexabridge/libnexa_bridge.xcframework"),
        .testTarget(
            name: "NexaLLamaTests",
            dependencies: ["llama"]
        ),
    ]
)
