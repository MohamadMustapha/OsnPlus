//
//  View+PixelButtonStyle.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 27/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public extension View {

    @ViewBuilder
    func pixelButtonStyle(_ buttonStyle: PixelButtonStyle) -> some View {
        switch buttonStyle {
        case .exposure(let theme):
            self.buttonStyle(PixelExposureButtonStyle(theme: theme))
        case .size:
            self.buttonStyle(PixelSizeButtonStyle())
        }
    }
}
