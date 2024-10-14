//
//  PixelTextConfiguration.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelTextConfiguration {

    let alignment: TextAlignment
    let colorStyle: PixelColorStyle
    let fontStyle: PixelFontStyle
    let lineLimit: Int?

    public init(alignment: TextAlignment,
                colorStyle: PixelColorStyle,
                fontStyle: PixelFontStyle,
                lineLimit: Int? = nil) {
        self.alignment = alignment
        self.colorStyle = colorStyle
        self.fontStyle = fontStyle
        self.lineLimit = lineLimit
    }
}
