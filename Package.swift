// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RANDARulesOfGolf",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RANDARulesOfGolf",
            targets: ["RANDARulesOfGolf"]
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
            url: "https://s3.eu-west-2.amazonaws.com/randa.rog.sdk.ios/1.4.0/RANDARulesOfGolf.xcframework.zip",
            checksum: "b51db91015447a34f0a1213b180bed8c1983ae9d4b9b9f96cceea5f8803f6f6a"
        )
    ]
)
