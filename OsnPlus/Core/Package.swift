// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package: Package = .init(
    name: .module,
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .coreProduct
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // MARK: Libraries
        .pixelPackageDependency
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .coreTarget
    ]
)

fileprivate extension Product {

    static let coreProduct: Product = .library(name: .core,
                                               targets: [.core])
}

fileprivate extension Package.Dependency {

    // MARK: Libraries
    static let pixelPackageDependency: Package.Dependency = package(url: "https://github.com/SweepLebanon/Pixel-AppleOS",
                                                                    exact: "1.0.9")
}

fileprivate extension String {

    // MARK: Module
    static let module: String = "Core"

    // MARK: Submodules
    static let core: String = "OSNCore"

    // MARK: Libraries
    static let pixel: String = "Pixel"
    static let pixelAppleOS: String = "Pixel-AppleOS"

    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v17)
}

fileprivate extension Target {

    static let coreTarget: Target = target(name: .core,
                                           dependencies: [.pixelDependency])
}

fileprivate extension Target.Dependency {

    // MARK: Submodules
    static let coreDependency: Target.Dependency = byName(name: .core)

    // MARK: Libraries
    static let pixelDependency: Target.Dependency = product(name: .pixel,
                                                            package: .pixelAppleOS)
}
