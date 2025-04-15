// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoxoStripe",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BoxoStripe",
            targets: ["BoxoStripe"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Appboxo/boxo-ios-spm.git", exact: "1.10.0"),
        .package(url: "https://github.com/stripe/stripe-ios-spm.git", exact: "24.0.0")
    ],
    targets: [
        .target(
            name: "BoxoStripe",
            dependencies: [
                .product(name: "StripePaymentSheet", package: "stripe-ios-spm"),
                .product(name: "BoxoSDK", package: "boxo-ios-spm")
            ])
    ]
)
