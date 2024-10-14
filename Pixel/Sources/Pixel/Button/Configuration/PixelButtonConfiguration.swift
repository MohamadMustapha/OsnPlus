//
//  PixelButtonConfiguration.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelButtonConfiguration {

    let icon: PixelButtonIcon
    let shape: PixelButtonShape
    let type: PixelButtonType

    public init(icon: PixelButtonIcon,
                shape: PixelButtonShape,
                type: PixelButtonType) {
        self.icon = icon
        self.shape = shape
        self.type = type
    }

    // MARK: PixelButtonType Shortcuts
    var iconSize: CGFloat { type.iconSize }

    var horizontalPadding: CGFloat { type.horizontalPadding }
    var iconPadding: CGFloat { type.iconPadding }
    var verticalPadding: CGFloat { type.verticalPadding }

    var pixelFont: PixelFont { type.pixelFont }

    var width: CGFloat { type.width }
}
