// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-push-driver-fcm",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherPushDriverFCM", targets: ["FeatherPushDriverFCM"]),
        .library(name: "FCM", targets: ["FCM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.21.2"),
        .package(url: "https://github.com/vapor/jwt-kit.git", .upToNextMinor(from: "5.1.0")),
        .package(url: "https://github.com/feather-framework/feather-push",
            .upToNextMinor(from: "0.4.0")
        ),
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
