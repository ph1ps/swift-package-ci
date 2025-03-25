import Foundation
import Subprocess

let githubOutputPath = ProcessInfo.processInfo.environment["GITHUB_OUTPUT"]!

let allPackages = try JSONDecoder().decode([String].self, from: Data(contentsOf: Bundle.module.url(forResource: "packages", withExtension: "json")!))
let selectedPackages = allPackages.shuffled().prefix(10)

_ = try await run(.name("echo"), arguments: ["packages=\(String(decoding: JSONEncoder().encode(Array(selectedPackages)), as: UTF8.self))"], output: .fileDescriptor(.open(githubOutputPath, .readWrite, options: .append), closeAfterSpawningProcess: true))
