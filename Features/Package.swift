// swift-tools-version: 5.10

import PackageDescription

let package: Package = .init(
    name: .packageName,
    platforms: [.iOS(.v17)],
    products: [
        .detailsProduct,
        .homeProduct,
        .profileProduct,
        .searchProduct
    ],
    dependencies: [
        // MARK: Local Packages
        .corePackageDependency,
        .networkPackageDependency,
        .pixelPackageDependency,
        
        // MARK: Packages
        .kingFisherPackageDependency
    ],
    targets: [
        .detailsTarget,

        .homeTarget,
        .homeTestTarget,

        .profileTarget,
        .profileTestTarget,

        .searchTarget,
        .searchTestTarget
    ]
)

private extension Package.Dependency {

    // MARK: Local Packages
    static let corePackageDependency: Package.Dependency = package(path: "../Core")
    static let networkPackageDependency: Package.Dependency = package(path: "../Network")
    static let pixelPackageDependency: Package.Dependency = package(path: "../Pixel")
    
    // MARK: Packages
    static let kingFisherPackageDependency: Package.Dependency = package(
        url: "https://github.com/onevcat/Kingfisher.git",
        exact: "7.11.0"
    )
}

private extension Product {

    static let detailsProduct: Product = .library(name: .details, targets: [.details])
    static let homeProduct: Product = .library(name: .home, targets: [.home])
    static let profileProduct: Product = .library(name: .profile, targets: [.profile])
    static let searchProduct: Product = .library(name: .search, targets: [.search])
}

private extension String {

    // MARK: Package Name
    static let packageName: String = "Features"

    // MARK: Modules
    static let details: String = "Details"
    static let home: String = "Home"
    static let profile: String = "Profile"
    static let search: String = "Search"

    // MARK: Local Packages
    static let core: String = "Core"
    static let osnCore: String = "OSNCore"
    
    static let network: String = "Network"
    static let osnNetwork: String = "OSNNetwork"
    
    static let pixel: String = "Pixel"
    
    // MARK: Packages
    static let kingFisher: String = "Kingfisher"

    var testTarget: String {
        "\(self)Tests"
    }
}

private extension Target {

    static let detailsTarget: Target = target(
        name: .details,
        dependencies: [
            .coreDependency,
            .networkDependency,
            .kingFisherDependency,
            .pixelDependency
        ]
    )

    static let homeTarget: Target = target(
        name: .home,
        dependencies: [
            .coreDependency,
            .networkDependency,
            .kingFisherDependency,
            .pixelDependency
        ]
    )
    static let homeTestTarget: Target = testTarget(name: .home.testTarget, dependencies: [.homeDependency])

    static let profileTarget: Target = target(
        name: .profile,
        dependencies: [
            .coreDependency,
            .networkDependency,
            .kingFisherDependency,
            .pixelDependency
        ]
    )
    static let profileTestTarget: Target = testTarget(name: .profile.testTarget, dependencies: [.profileDependency])

    static let searchTarget: Target = target(
        name: .search,
        dependencies: [
            .coreDependency,
            .networkDependency,
            .kingFisherDependency,
            .pixelDependency
        ]
    )
    static let searchTestTarget: Target = testTarget(name: .search.testTarget, dependencies: [.searchDependency])
}

fileprivate extension Target.Dependency {

    // MARK: Modules
    static let detailsDependency: Target.Dependency = byName(name: .details)
    static let homeDependency: Target.Dependency = byName(name: .home)
    static let profileDependency: Target.Dependency = byName(name: .profile)
    static let searchDependency: Target.Dependency = byName(name: .search)

    // MARK: Local Packages
    static let coreDependency: Target.Dependency = product(name: .osnCore, package: .core)
    static let networkDependency: Target.Dependency = product(name: .osnNetwork, package: .network)
    static let pixelDependency: Target.Dependency = byName(name: .pixel)
    
    // MARK: Packages
    static let kingFisherDependency: Target.Dependency = byName(name: .kingFisher)
}
