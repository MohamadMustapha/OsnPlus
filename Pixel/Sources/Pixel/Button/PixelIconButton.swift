//
//  PixelIconButton.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelIconButton: View {

    private let buttonStyle: PixelButtonStyle
    private let icon: PixelButtonIcon

    private let action: () -> Void

    public init(buttonStyle: PixelButtonStyle = .size,
                configuration: PixelButtonIcon.Configuration,
                action: @escaping () -> Void) {
        self.buttonStyle = buttonStyle
        self.icon = .after(configuration)
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            switch icon {
            case .after(let configuration):
                configuration.image
                    .resizable()
                    .scaledToFit()
                    .fontWeight(configuration.weight)
                    .foregroundStyle(configuration.colorStyle.color)
            default:
                EmptyView()
            }
        }
        .pixelButtonStyle(buttonStyle)
    }
}

#Preview {
    VStack {
        PixelIconButton(configuration: .init(colorStyle: .single(color: .blue),
                                             image: .init(systemName: "clock"))) {
            print("Clock Button Pressed")
        }

        PixelIconButton(buttonStyle: .exposure(theme: .light),
                        configuration: .init(colorStyle: .single(color: .blue),
                                             image: PixelImage.Icon.Sweep.regular)) {
            print("Sweep Button Pressed")
        }
    }
}
