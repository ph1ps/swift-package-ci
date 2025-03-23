// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "SwiftPackageIndexCI",
  dependencies: [
    .package(url: "https://github.com/iCharlesHu/Subprocess", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "SwiftPackageIndexCI",
      dependencies: [
        .product(name: "Subprocess", package: "Subprocess")
      ]
    ),
  ]
)
