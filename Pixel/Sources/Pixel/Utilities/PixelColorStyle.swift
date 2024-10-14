//
//  PixelColorStyle.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public enum PixelColorStyle {

    case single(color: Color)
    case theme(lightColor: Color, darkColor: Color, theme: PixelTheme)
    indirect case conditional(activeColorStyle: PixelColorStyle, inactiveColorStyle: PixelColorStyle, isActive: Bool)

    public var color: Color {
        switch self {
        case .single(let color):
            return color
        case .theme(let lightColor, let darkColor, let theme):
            return theme == .light ? lightColor : darkColor
        case .conditional(let activeColorStyle, let inactiveColorStyle, let isActive):
            return isActive ? activeColorStyle.color : inactiveColorStyle.color
        }
    }
}
