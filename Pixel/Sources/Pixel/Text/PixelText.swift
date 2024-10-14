//
//  PixelText.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelText: View {

    private let configuration: PixelTextConfiguration
    private let text: String

    public init(configuration: PixelTextConfiguration, text: String) {
        self.configuration = configuration
        self.text = text
    }

    public var body: some View {
        Text(text)
            .font(pixelFont.font)
            .foregroundStyle(color)
            .lineLimit(configuration.lineLimit)
            .multilineTextAlignment(configuration.alignment)
            .textCase(pixelFont.isCaps ? .uppercase : .none)
            .tracking(PixelFont.letterSpacing)
    }

    private var color: Color {
        configuration.colorStyle.color
    }

    private var pixelFont: PixelFont {
        configuration.fontStyle.font
    }
}

#Preview {
    PixelText(configuration: .init(alignment: .leading,
                                   colorStyle: .single(color: PixelColor.dark8),
                                   fontStyle: .single(font: .superDino1)),
              text: "Hello World")
}
