// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "RANDARulesOfGolf",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RANDARulesOfGolf",
            targets: ["RANDARulesOfGolf", "RANDARulesOfGolfDependencies"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Cocoanetics/DTCoreText.git", from: "1.6.28"),
        .package(url: "https://github.com/Cocoanetics/DTFoundation.git", from: "1.7.19"),
        .package(url: "https://github.com/Daltron/NotificationBanner", from: "4.0.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.11.1")
    ],
    targets: [
        .binaryTarget(
            name: "RANDARulesOfGolf",
            url: "https://s3.eu-west-2.amazonaws.com/randa.rog.sdk.ios/1.4.2/RANDARulesOfGolf.xcframework.zip",
            checksum: "b3baa7c503cb1913be9ec4622d37f09015c820b88dc8dd4381cdb03a5f404d33"
        ),
        .target(
            name: "RANDARulesOfGolfDependencies",
            dependencies: [
                .product(name: "DTCoreText", package: "DTCoreText"),
                .product(name: "DTFoundation", package: "DTFoundation"),
                .product(name: "NotificationBannerSwift", package: "NotificationBanner"),
                .product(name: "SwiftSoup", package: "SwiftSoup")
            ],
            path: "Dependencies"
        )
    ]
)
