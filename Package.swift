// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "SwiftPackageIndexCI",
  platforms: [.macOS(.v15)],
  products: [
    .executable(name: "GetNextPackages", targets: ["GetNextPackages"]),
    .executable(name: "BuildPackage", targets: ["BuildPackage"])
  ],
  dependencies: [
    .package(url: "https://github.com/iCharlesHu/Subprocess", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "GetNextPackages",
      resources: [
        .process("packages.json")
      ]
    ),
    .executableTarget(
      name: "BuildPackage",
      dependencies: [
        .product(name: "Subprocess", package: "Subprocess")
      ]
    ),
  ]
)
