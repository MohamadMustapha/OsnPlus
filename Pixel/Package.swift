// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: .packageName,
    platforms: [.iOS(.v17)],
    products: [.pixelProduct],
    targets: [.pixelTarget]
)

private extension Product {
    
    static let pixelProduct: Product = .library(name: .pixel, targets: [.pixel])
}

private extension String {
    
    // MARK: Package Name
    static let packageName: String = "Pixel"
    
    // MARK: Modules
    static let pixel: String = "Pixel"
}

private extension Target {

    static let pixelTarget: Target = target(name: .pixel)
}
