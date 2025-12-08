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
            url: "https://s3.eu-west-2.amazonaws.com/randa.rog.sdk.ios/1.4.1/RANDARulesOfGolf.xcframework.zip",
            checksum: "262a91af1a17d59fe44225b1f4d7015a50c4ead1f9b2fdbeb5b9dcf7e2b04607"
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
