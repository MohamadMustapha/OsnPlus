// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: .package,
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .forgeProduct
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .forgeTarget,
        .forgeTestTarget
    ]
)

fileprivate extension Package.Dependency {

    // MARK: Plugins
    static let swiftLintPackageDependency: Package.Dependency = package(url: "https://github.com/realm/SwiftLint.git",
                                                                        from: "0.55.0")
}

fileprivate extension Product {

    static let forgeProduct: Product = .library(name: .forge,
                                                targets: [.forge])
}

fileprivate extension String {

    // MARK: Package
    static let package: String = "Forge"

    // MARK: Modules
    static let forge: String = "Forge"

    // MARK: Local Packages

    // MARK: Third Party Packages

    // MARK: Plugins
    static let swiftLint: String = "SwiftLint"
    static let swiftLintPlugin: String = "SwiftLintBuildToolPlugin"

    // MARK: Test Modules
    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v17)
}

fileprivate extension Target {

    static let forgeTarget: Target = target(name: .forge)
    static let forgeTestTarget: Target = testTarget(name: .forge.testTarget,
                                                    dependencies: [.forgeDependency])
}

fileprivate extension Target.Dependency {

    // MARK: Modules
    static let forgeDependency: Target.Dependency = byName(name: .forge)
}

fileprivate extension Target.PluginUsage {

    static let swiftLintPlugin: Target.PluginUsage = plugin(name: .swiftLintPlugin,
                                                            package: .swiftLint)
}
