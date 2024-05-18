//
//  DecreaseSizeButtonStyle.swift
//
//
//  Created by Mohamad Mustapha on 18/05/2024.
//

import SwiftUI

public struct DecreaseSizeButtonStyle: ButtonStyle {

    public init() { }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.bouncy(duration: 0.3), value: configuration.isPressed)
            .sensoryFeedback(.impact, trigger: configuration.isPressed)
    }
}
