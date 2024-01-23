// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "q2successPresentation",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "q2successPresentation",
            targets: ["q2successPresentation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(path: "q2successStudent"),
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "git@github.com:spearway/q2successStudent.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "q2successPresentation",
            dependencies: ["q2successStudent"],
            resources: [.process("Resources")]),
        .testTarget(
            name: "q2successPresentationTests",
            dependencies: ["q2successPresentation", "q2successStudent"]),
    ]
)
