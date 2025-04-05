// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClientHub",
    platforms: [
        .iOS(.v14), .macOS(.v11), .tvOS(.v14), .watchOS(.v7)
    ],
    products: [
        .library(name: "ClientHub", targets: ["ClientHub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/alibaba/aliyunpan-ios-sdk", .upToNextMajor(from: "0.3.6")),
        .package(url: "https://github.com/kishikawakatsumi/SMBClient", .upToNextMajor(from: "0.3.1")),
        .package(url: "https://github.com/alexiscn/EmbyKit", .branch("main")),
        .package(url: "https://github.com/BBC6BAE9/cachekit", .upToNextMajor(from: "0.0.3"))
    ],
    targets: [
        .target(
            name: "ClientHub",
            dependencies: [
                .product(name: "AliyunpanSDK", package: "aliyunpan-ios-sdk"),
                .product(name: "SMBClient", package: "SMBClient"),
                "EmbyKit",
                "CacheKit"
            ]
        ),
        .testTarget(
            name: "ClientHubTests",
            dependencies: ["ClientHub"]
        )
    ]
)
