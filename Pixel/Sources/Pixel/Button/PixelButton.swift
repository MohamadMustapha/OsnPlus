//
//  PixelButton.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelButton: View {

    private let buttonConfiguration: PixelButtonConfiguration
    private let buttonStyle: PixelButtonStyle
    private let text: String
    private let textConfiguration: PixelTextConfiguration

    private let action: () -> Void

    public init(buttonStyle: PixelButtonStyle = .size,
                configuration: PixelButtonConfiguration,
                text: String,
                textColorStyle: PixelColorStyle,
                action: @escaping () -> Void) {
        self.buttonConfiguration = configuration
        self.buttonStyle = buttonStyle
        self.text = text
        self.textConfiguration = .init(alignment: .center,
                                       colorStyle: textColorStyle,
                                       fontStyle: .single(font: configuration.pixelFont),
                                       lineLimit: 1)
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: buttonConfiguration.iconPadding) {
                if case PixelButtonIcon.before = buttonConfiguration.icon {
                    iconView
                }

                PixelText(configuration: textConfiguration,
                          text: text)

                if case PixelButtonIcon.after = buttonConfiguration.icon {
                    iconView
                }
            }
            .padding(.horizontal, buttonConfiguration.horizontalPadding)
            .padding(.vertical, buttonConfiguration.verticalPadding)
            .buttonWidth(buttonConfiguration.width, alignment: .center)
            .background(backgroundView)
            .overlay(borderView)
        }
        .pixelButtonStyle(buttonStyle)
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch buttonConfiguration.shape {
        case .square(let configuration):
            RoundedRectangle(cornerRadius: .medium)
                .fill(configuration.backgroundColorStyle.color)
        case .rounded(let configuration):
            Capsule()
                .fill(configuration.backgroundColorStyle.color)
        }
    }

    @ViewBuilder
    private var borderView: some View {
        switch buttonConfiguration.shape {
        case .square(let configuration):
            RoundedRectangle(cornerRadius: .medium)
                .stroke(configuration.borderColorStyle.color)
        case .rounded(let configuration):
            Capsule()
                .stroke(configuration.borderColorStyle.color)
        }
    }

    @ViewBuilder
    private var iconView: some View {
        switch buttonConfiguration.icon {
        case .before(let configuration), .after(let configuration):
            configuration.image
                .resizable()
                .scaledToFit()
                .foregroundStyle(configuration.colorStyle.color)
                .fontWeight(configuration.weight)
                .frame(width: buttonConfiguration.iconSize, height: buttonConfiguration.iconSize)
        case .none:
            EmptyView()
        }
    }
}

fileprivate extension View {

    @ViewBuilder
    func buttonWidth(_ width: CGFloat, alignment: Alignment) -> some View {
        switch width {
        case .infinity:
            self.frame(maxWidth: width, alignment: alignment)
        default:
            self.frame(minWidth: width, alignment: alignment)
        }
    }
}

#Preview {
    PixelButton(configuration: .init(icon: .before(.init(colorStyle: .single(color: .green),
                                                         image: .init(systemName: "pencil"))),
                                     shape: .square(.init(backgroundColorStyle: .single(color: .blue.opacity(0.25)),
                                                          borderColorStyle: .single(color: .black))),
                                     type: .normal(isFullWidth: false, textStyle: .normal)),
                text: "Pencil",
                textColorStyle: .single(color: .blue)) {
        print("Pencil tapped!")
    }
}
