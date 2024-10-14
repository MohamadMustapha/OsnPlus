// swift-tools-version: 5.10

import PackageDescription

let package: Package = .init(
    name: .packageName,
    platforms: [.iOS(.v17)],
    products: [.coreProduct],
    dependencies: [
        // MARK: Local Packages
        .pixelPackageDependency,
        
        // MARK: Packages
        .kingFisherPackageDependency,
        .lottiePackageDependency
    ],
    targets: [.coreTarget]
)

private extension Package.Dependency {

    // MARK: Local Packages
    static let pixelPackageDependency: Package.Dependency = package(path: "../Pixel")
    
    // MARK: Packages
    static let kingFisherPackageDependency: Package.Dependency = package(
        url: "https://github.com/onevcat/Kingfisher.git",
        exact: "7.11.0"
    )
    static let lottiePackageDependency: Package.Dependency = package(
        url: "https://github.com/airbnb/lottie-spm",
        exact: "4.4.1"
    )
}

private extension Product {

    static let coreProduct: Product = .library(name: .core, targets: [.core])
}

private extension String {

    // MARK: Package Name
    static let packageName: String = "Core"

    // MARK: Modules
    static let core: String = "OSNCore"

    // MARK: Local Packages
    static let pixel: String = "Pixel"
    
    // MARK: Packages
    static let kingFisher: String = "Kingfisher"
    
    static let lottie: String = "Lottie"
    static let lottieSpm: String = "lottie-spm"
    
    var testTarget: String {
        "\(self)Tests"
    }
}

private extension Target {

    static let coreTarget: Target = .target(
        name: .core,
        dependencies: [
            .kingFisherDependency,
            .lottieDependency,
            .pixelDependency
        ]
    )
}

private extension Target.Dependency {

    // MARK: Modules
    static let coreDependency: Target.Dependency = byName(name: .core)

    // MARK: Local Packages
    static let pixelDependency: Target.Dependency = byName(name: .pixel)
    
    // MARK: Packages
    static let kingFisherDependency: Target.Dependency = byName(name: .kingFisher)
    static let lottieDependency: Target.Dependency = product(name: .lottie, package: .lottieSpm)
}
