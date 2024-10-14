//
//  PixelFontStyle.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import Foundation

public enum PixelFontStyle {

    case single(font: PixelFont)
    case theme(lightFont: PixelFont, darkFont: PixelFont, theme: PixelTheme)
    indirect case conditional(activeFontStyle: PixelFontStyle, inactiveFontStyle: PixelFontStyle, isActive: Bool)

    public var font: PixelFont {
        switch self {
        case .single(let font):
            return font
        case .theme(let lightFont, let darkFont, let theme):
            return theme == .light ? lightFont : darkFont
        case .conditional(let activeFontStyle, let inactiveFontStyle, let isActive):
            return isActive ? activeFontStyle.font : inactiveFontStyle.font
        }
    }
}
