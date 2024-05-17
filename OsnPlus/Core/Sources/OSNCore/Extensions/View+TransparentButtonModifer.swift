//
//  File.swift
//  
//
//  Created by Mohamad Mustapha on 17/05/2024.
//

import Pixel
import SwiftUI

public extension View {
    func transparentButtonStyle(colorStyle: PixelColorStyle, type: TransparentButtonStyle.Shape ) -> some View {
        self.modifier(TransparentButtonStyle(type, colorStyle))
    }
}
