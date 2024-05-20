// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package: Package = .init(
    name: .module,
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .homeProduct,
        .profileProduct,
        .searchProduct
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // MARK: Libraries
        .kingFisherPackageDependency,
        .pixelPackageDependency,

        // MARK: Local Libraries
        .corePackageDependency,
        .networkPackageDependency
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .homeTarget,
        .homeTestTarget,

        .profileTarget,
        .profileTestTarget,

        .searchTarget,
        .searchTestTarget
    ]
)

fileprivate extension Product {

    static let homeProduct: Product = .library(name: .home,
                                               targets: [.home])
    static let profileProduct: Product = .library(name: .profile,
                                                  targets: [.profile])
    static let searchProduct: Product = .library(name: .search,
                                                 targets: [.search])
}

fileprivate extension Package.Dependency {

    // MARK: Libraries
    static let kingFisherPackageDependency: Package.Dependency = package(url: "https://github.com/onevcat/Kingfisher.git",
                                                                         exact: "7.11.0")
    static let pixelPackageDependency: Package.Dependency = package(url: "https://github.com/SweepLebanon/Pixel-AppleOS.git",
                                                                    exact: "1.0.9")

    // MARK: Local Libraries
    static let corePackageDependency: Package.Dependency = package(path: "../Core")
    static let networkPackageDependency: Package.Dependency = package(path: "../Network")
}

fileprivate extension String {

    // MARK: Module
    static let module: String = "Features"

    // MARK: Submodules
    static let home: String = "Home"
    static let profile: String = "Profile"
    static let search: String = "Search"

    // MARK: Libraries
    static let kingFisher: String = "Kingfisher"

    static let pixel: String = "Pixel"
    static let pixelAppleOS: String = "Pixel-AppleOS"

    // MARK: Local Libraries
    static let core: String = "Core"
    static let osnCore: String = "OSNCore"

    static let network: String = "Network"
    static let osnNetwork: String = "OSNNetwork"

    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v17)
}

fileprivate extension Target {

    static let homeTarget: Target = target(name: .home,
                                           dependencies: [.coreDependency,
                                                          .networkDependency,
                                                          .kingFisherDependency,
                                                          .pixelDependency])
    
    static let homeTestTarget: Target = testTarget(name: .home.testTarget,
                                                   dependencies: [.homeDependency])

    static let profileTarget: Target = target(name: .profile,
                                              dependencies: [.coreDependency,
                                                             .networkDependency,
                                                             .kingFisherDependency,
                                                             .pixelDependency])

    static let profileTestTarget: Target = testTarget(name: .profile.testTarget,
                                                      dependencies: [.profileDependency])

    static let searchTarget: Target = target(name: .search,
                                             dependencies: [.coreDependency,
                                                            .networkDependency,
                                                            .kingFisherDependency,
                                                            .pixelDependency])

    static let searchTestTarget: Target = testTarget(name: .search.testTarget,
                                                     dependencies: [.searchDependency])
}

fileprivate extension Target.Dependency {

    // MARK: Submodules
    static let homeDependency: Target.Dependency = byName(name: .home)
    static let profileDependency: Target.Dependency = byName(name: .profile)
    static let searchDependency: Target.Dependency = byName(name: .search)

    // MARK: Libraries
    static let kingFisherDependency: Target.Dependency = byName(name: .kingFisher)
    static let pixelDependency: Target.Dependency = product(name: .pixel,
                                                            package: .pixelAppleOS)

    // MARK: Local Libraries
    static let coreDependency: Target.Dependency = product(name: .osnCore,
                                                           package: .core)
    static let networkDependency: Target.Dependency = product(name: .osnNetwork,
                                                              package: .network)
}
