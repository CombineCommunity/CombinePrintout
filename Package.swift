// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "CombinePrintout",
    platforms: [
      .iOS(.v13),
    ],
    products: [
        .library(
            name: "CombinePrintout",
            targets: ["CombinePrintout"]),
    ],
    targets: [
        .target(
            name: "CombinePrintout",
            dependencies: []),
        .testTarget(
            name: "CombinePrintoutTests",
            dependencies: ["CombinePrintout"]),
    ]
)
