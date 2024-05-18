//
//  View+FadeOutScrollView.swift
//
//
//  Created by Mohamad Mustapha on 18/05/2024.
//

import SwiftUI

public extension View {
    func fadeOutScrollView(fadeLength: CGFloat = 50) -> some View {
        return mask(
            VStack(spacing: 0) {
                // Top gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: fadeLength)

                Rectangle().fill(Color.black)

                // Bottom gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: fadeLength)
            }
        )
    }
}
