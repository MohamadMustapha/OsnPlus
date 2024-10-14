//
//  PixelButtonIcon.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public enum PixelButtonIcon {

    public struct Configuration {

        let colorStyle: PixelColorStyle
        let image: Image
        let weight: Font.Weight

        public init(colorStyle: PixelColorStyle, image: Image, weight: Font.Weight = .regular) {
            self.colorStyle = colorStyle
            self.image = image
            self.weight = weight
        }
    }

    case none, before(Configuration), after(Configuration)
}
