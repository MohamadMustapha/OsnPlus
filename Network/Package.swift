// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package: Package = .init(
    name: .module,
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .osnNetworkProduct
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // MARK: Libraries
        .pixelPackageDependency
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .OsnNetworkTarget
    ]
)

fileprivate extension Product {

    static let osnNetworkProduct: Product = .library(name: .osnNetwork,
                                               targets: [.osnNetwork])
}

fileprivate extension Package.Dependency {

    // MARK: Libraries
    static let pixelPackageDependency: Package.Dependency = package(url: "https://github.com/SweepLebanon/Pixel-AppleOS",
                                                                    exact: "1.0.9")
}

fileprivate extension String {

    // MARK: Module
    static let module: String = "Network"

    // MARK: Submodules
    static let osnNetwork: String = "OSNNetwork"

    // MARK: Libraries
    static let pixel: String = "Pixel"
    static let pixelAppleOS: String = "Pixel-AppleOS"

    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v17)
}

fileprivate extension Target {

    static let OsnNetworkTarget: Target = target(name: .osnNetwork,
                                           dependencies: [.pixelDependency])
}

fileprivate extension Target.Dependency {

    // MARK: Submodules
    static let OsnNetworkDependency: Target.Dependency = byName(name: .osnNetwork)

    // MARK: Libraries
    static let pixelDependency: Target.Dependency = product(name: .pixel,
                                                            package: .pixelAppleOS)
}
