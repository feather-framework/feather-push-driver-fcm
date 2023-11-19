// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-push-driver-fcm",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "FeatherPushDriverFCM", targets: ["FeatherPushDriverFCM"]),
        .library(name: "FCM", targets: ["FCM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.17.0"),
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.9.0"),
        .package(url: "https://github.com/feather-framework/feather-push.git", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        .target(
            name: "FCM",
            dependencies: [
                .product(name: "JWTKit", package: "jwt-kit"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
            ]
        ),
        .target(
            name: "FeatherPushDriverFCM",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
                .target(name: "FCM")
            ]
        ),
        .testTarget(
            name: "FCMTests",
            dependencies: [
                .target(name: "FCM"),
            ]
        ),
        .testTarget(
            name: "FeatherPushDriverFCMTests",
            dependencies: [
                .product(name: "FeatherPush", package: "feather-push"),
                .product(name: "XCTFeatherPush", package: "feather-push"),
                .target(name: "FeatherPushDriverFCM"),
            ]
        ),
    ]
)
