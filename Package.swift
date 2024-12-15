// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppBoxoStripe",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AppBoxoStripe",
            targets: ["AppBoxoStripe"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Appboxo/appboxo-ios-spm.git", exact: "1.7.7"),
        .package(url: "https://github.com/stripe/stripe-ios-spm.git", exact: "24.0.0")
    ],
    targets: [
        .target(
            name: "AppBoxoStripe",
            dependencies: [
                .product(name: "StripePaymentSheet", package: "stripe-ios-spm"),
                .product(name: "AppBoxoSDK", package: "appboxo-ios-spm")
            ])
    ]
)
