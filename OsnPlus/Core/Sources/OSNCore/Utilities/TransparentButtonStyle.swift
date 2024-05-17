//
//  TransparentButtonStyle.swift
//
//
//  Created by Mohamad Mustapha on 17/05/2024.
//

import Pixel
import SwiftUI

public struct TransparentButtonStyle: ViewModifier {

    public enum Shape {
        case capsule, circle
    }

    private let type: Shape
    private let colorStyle: PixelColorStyle

    init(_ type: Shape, _ colorStyle: PixelColorStyle) {
        self.type = type
        self.colorStyle = colorStyle
    }

    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, .p8)
            .padding(.vertical, .p4)
            .background(
                shape
            )
    }

    @ViewBuilder
    private var shape: some View {
        switch type {
        case .capsule:
            Capsule()
                .fill(colorStyle.color.opacity(0.1))
                .stroke(colorStyle.color, lineWidth: 0.3)

        case .circle:
            Circle()
                .fill(colorStyle.color.opacity(0.1))
                .stroke(colorStyle.color, lineWidth: 0.3)
        }
    }
}
