import Foundation

let allPackages = try JSONDecoder().decode([String].self, from: Data(contentsOf: Bundle.module.url(forResource: "packages", withExtension: "json")!))
let selectedPackages = allPackages.shuffled().prefix(5)
try JSONEncoder().encode(Array(selectedPackages)).write(to: URL.currentDirectory().appending(path: "selected-packages.json"))
