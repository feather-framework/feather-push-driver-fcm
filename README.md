# Feather Push Driver FCM

A Push driver for the Feather CMS Push service using Google FCM.

## Getting started

⚠️ This repository is a work in progress, things can break until it reaches v1.0.0. 

Use at your own risk.

### Adding the dependency

To add a dependency on the package, declare it in your `Package.swift`:

```swift
.package(url: "https://github.com/feather-framework/feather-push-driver-fcm", .upToNextMinor(from: "0.1.0")),
```

and to your application target, add `FeatherPushDriverFCM` to your dependencies:

```swift
.product(name: "FeatherPushDriverFCM", package: "feather-push-driver-fcm")
```

Example `Package.swift` file with `FeatherPushDriverFCM` as a dependency:

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "my-application",
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-Push-driver-fcm", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        .target(name: "MyApplication", dependencies: [
            .product(name: "FeatherPushDriverFCM", package: "feather-Push-driver-fcm")
        ]),
        .testTarget(name: "MyApplicationTests", dependencies: [
            .target(name: "MyApplication"),
        ]),
    ]
)
```
