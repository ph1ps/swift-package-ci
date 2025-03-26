import Foundation
import Subprocess

extension CollectedResult where Error == StringOutput<UTF8> {
  
  func verifyTerminationStatus0() throws {
    if terminationStatus != .exited(0) {
      throw TerminationStatusError(status: terminationStatus, standardError: standardError)
    }
  }
}

struct BuildResult {
  let package: String
  let buildTime: ContinuousClock.Duration
}

struct BuildError: Error {
  let package: String
  let base: any Error
}

struct TerminationStatusError: Error {
  let status: TerminationStatus
  let standardError: String?
}

let selectedPackages = try JSONDecoder().decode([String].self, from: Data(contentsOf: URL.currentDirectory().appending(path: "selected-packages.json")))

for package in selectedPackages {
    let packagePath = "repositories/\(package)"
    print("Fetching", packagePath)
    try await run(.name("git"), arguments: ["clone", "--depth=1", "https://github.com/\(package).git", packagePath], output: .discarded, error: .string)
      .verifyTerminationStatus0()
    print("Building", packagePath)
    
    var buildArguments = ["build", "--package-path", packagePath, "--cache-path", "cache"]
    if let swiftSDK = ProcessInfo.processInfo.environment["SWIFT_SDK"] {
        buildArguments.append(contentsOf: ["--swift-sdk", swiftSDK])
    }
    try await run(.name("swift"), arguments: Arguments(buildArguments), output: .discarded, error: .string)
      .verifyTerminationStatus0()
}
