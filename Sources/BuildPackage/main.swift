import Subprocess
/*
let packages = [
  "pointfreeco/combine-schedulers",
  "pointfreeco/sharing-grdb",
  "pointfreeco/swift-case-paths",
  "pointfreeco/swift-clocks",
 //"pointfreeco/swift-concurrency-extras",
 //"pointfreeco/swift-custom-dump",
 //"pointfreeco/swift-dependencies",
 //"pointfreeco/swift-gen",
 //"pointfreeco/swift-html",
 //"pointfreeco/swift-html-vapor",
 //"pointfreeco/swift-identified-collections",
 //"pointfreeco/swift-issue-reporting",
 //"pointfreeco/swift-macro-testing",
 //"pointfreeco/swift-navigation",
 //"pointfreeco/swift-nonempty",
 //"pointfreeco/swift-overture",
 //"pointfreeco/swift-parsing",
 //"pointfreeco/swift-perception",
 //"pointfreeco/swift-prelude",
 //"pointfreeco/swift-sharing",
 //"pointfreeco/swift-snapshot-testing",
 //"pointfreeco/swift-tagged",
 //"pointfreeco/swift-url-routing",
 //"pointfreeco/swift-validated",
 //"pointfreeco/swift-web",
 //"pointfreeco/swiftui-navigation"
]

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

extension CollectedResult where Error == StringOutput<UTF8> {
  
  func verifyTerminationStatus0() throws {
    if terminationStatus != .exited(0) {
      throw TerminationStatusError(status: terminationStatus, standardError: standardError)
    }
  }
}

let clock = ContinuousClock()

let duration = await clock.measure {
  
  await withTaskGroup(of: Result<BuildResult, BuildError>.self) { taskGroup in
    
    var packages = packages
    
    func queue() {
      if !packages.isEmpty {
        let package = packages.removeFirst()
        taskGroup.addTask {
          await build(package)
        }
      }
    }
    
    func build(_ package: String) async -> Result<BuildResult, BuildError> {
      do {
        let packagePath = "repositories/\(package)"
        let duration = try await clock.measure {
          try await run(.name("git"), arguments: ["clone", "--depth=1", "https://github.com/\(package).git", packagePath], output: .discarded, error: .string)
            .verifyTerminationStatus0()
          try await run(.name("swift"), arguments: ["build", "--package-path", packagePath, "--cache-path", "cache"], output: .discarded, error: .string)
            .verifyTerminationStatus0()
        }
        return .success(.init(package: package, buildTime: duration))
      } catch {
        return .failure(.init(package: package, base: error))
      }
    }
    
    for _ in 0..<4 {
      queue()
    }
    
    print("remaining", packages.count)
    for await result in taskGroup {
      switch result {
      case .success(let result):
        print("build success", result.package, "time", result.buildTime)
      case .failure(let error):
        print("build failure", error.package, error.base)
      }
      queue()
      print("remaining", packages.count)
    }
  }
}

print("done in", duration)
*/
