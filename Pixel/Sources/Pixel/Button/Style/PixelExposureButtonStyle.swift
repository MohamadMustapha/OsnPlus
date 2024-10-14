//
//  PixelExposureButtonStyle.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 27/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelExposureButtonStyle: ButtonStyle {

    let theme: PixelTheme

    public init(theme: PixelTheme) {
        self.theme = theme
    }

    public func makeBody(configuration: Configuration) -> some View {
        ConfiguredButton(brightness: theme == .light ? -0.1 : 0.1,
                         configuration: configuration)
    }
}

private struct ConfiguredButton: View {

    @Environment(\.isEnabled) private var isEnabled: Bool

    let brightness: CGFloat
    let configuration: ButtonStyleConfiguration

    public var body: some View {
        configuration.label
            .brightness(configuration.isPressed ? brightness : 0.0)
            .opacity(isEnabled ? 1.0 : 0.5)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
