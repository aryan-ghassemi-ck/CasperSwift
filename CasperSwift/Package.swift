// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CasperSwift",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "CasperSwift",
            targets: ["CasperSwift"]),
    ],
    dependencies: [
        .package(name:"Blake2",url: "https://github.com/tesseract-one/Blake2.swift.git", from: "0.1.0"),
        .package(url: "https://github.com/leif-ibsen/SwiftECC", from: "3.2.0")
    ],
    targets: [
        .target(
            name: "CasperSwift",
            dependencies: [
                "Blake2",
                .product(name: "SwiftECC", package: "SwiftECC")
            ]),
        .testTarget(
            name: "CasperSwiftTests",
            dependencies: ["CasperSwift"]),
    ]
)
