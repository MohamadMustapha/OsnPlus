//
//  PixelSizeButtonStyle.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelSizeButtonStyle: ButtonStyle {

    public init() { }

    public func makeBody(configuration: Configuration) -> some View {
        ConfiguredButton(configuration: configuration)
    }
}

private struct ConfiguredButton: View {

    @Environment(\.isEnabled) private var isEnabled: Bool

    let configuration: ButtonStyleConfiguration

    public var body: some View {
        configuration.label
            .opacity(isEnabled ? 1.0 : 0.5)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(duration: 0.2), value: configuration.isPressed)
    }
}
