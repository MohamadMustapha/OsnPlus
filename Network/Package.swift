// swift-tools-version: 5.10

import PackageDescription

let package: Package = .init(
    name: .packageName,
    platforms: [.iOS(.v17)],
    products: [.osnNetworkProduct],
    targets: [.osnNetworkTarget]
)

private extension Product {

    static let osnNetworkProduct: Product = .library(name: .osnNetwork, targets: [.osnNetwork])
}

private extension String {

    // MARK: Package Name
    static let packageName: String = "Network"

    // MARK: Modules
    static let osnNetwork: String = "OSNNetwork"

    var testTarget: String {
        "\(self)Tests"
    }
}

private extension Target {

    static let osnNetworkTarget: Target = target(name: .osnNetwork)
}
