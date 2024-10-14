//
//  PixelButtonType.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public enum PixelButtonType {

    public enum TextStyle {

        case normal, bold, highlighted
    }

    case skinny(isFullWidth: Bool, textStyle: TextStyle)
    case normal(isFullWidth: Bool, textStyle: TextStyle)
    case big(isFullWidth: Bool, textStyle: TextStyle)

    var iconSize: CGFloat {
        switch self {
        case .skinny:
            return 14
        case .normal:
            return 16
        case .big:
            return 18
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .skinny:
            return .p9
        case .normal:
            return .p10
        case .big:
            return .p11
        }
    }

    var iconPadding: CGFloat {
        switch self {
        case .skinny, .normal:
            return .p4
        case .big:
            return .p5
        }
    }

    var verticalPadding: CGFloat {
        switch self {
        case .skinny:
            return .p3
        case .normal:
            return .p4
        case .big:
            return .p5
        }
    }

    var pixelFont: PixelFont {
        switch self {
        case .skinny(_, let textStyle):
            return textStyle == .normal ? .medium3 : textStyle == .bold ? .medium1 : .capsSmall
        case .normal(_, let textStyle):
            return textStyle == .normal ? .big4 : textStyle == .bold ? .big2 : .capsMedium
        case .big(_, let textStyle):
            return textStyle == .normal ? .dino4 : textStyle == .bold ? .dino3 : .capsBig
        }
    }

    var width: CGFloat {
        switch self {
        case .skinny(let isFullWidth, _):
            return isFullWidth ? .infinity : 70
        case .normal(let isFullWidth, _):
            return isFullWidth ? .infinity : 82
        case .big(let isFullWidth, _):
            return isFullWidth ? .infinity : 94
        }
    }
}
