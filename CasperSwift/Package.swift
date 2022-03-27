// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CasperSwift",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CasperSwift",
            targets: ["CasperSwift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CasperSwift",
            dependencies: []),
        .testTarget(
            name: "CasperSwiftTests",
            dependencies: ["CasperSwift"]),
    ]
)
