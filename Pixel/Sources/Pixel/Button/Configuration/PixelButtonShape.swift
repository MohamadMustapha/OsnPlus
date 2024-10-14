//
//  PixelButtonShape.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public enum PixelButtonShape {

    public struct Configuration {

        let backgroundColorStyle: PixelColorStyle
        let borderColorStyle: PixelColorStyle

        public init(backgroundColorStyle: PixelColorStyle, borderColorStyle: PixelColorStyle) {
            self.backgroundColorStyle = backgroundColorStyle
            self.borderColorStyle = borderColorStyle
        }
    }

    case square(Configuration), rounded(Configuration)
}
