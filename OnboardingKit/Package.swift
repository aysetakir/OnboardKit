// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "OnboardingKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "OnboardingKit",
            targets: ["OnboardingKit"]
        ),
    ],
    targets: [
        .target(
            name: "OnboardingKit"
        ),

    ]
)
