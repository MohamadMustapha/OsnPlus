//
//  ErrorView.swift
//
//
//  Created by Mohamad Mustapha on 07/06/2024.
//

import Lottie
import Pixel
import SwiftUI

public struct ErrorView: View {

    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        VStack(spacing: .p10) {
            PixelText(configuration: .error, text: "Something went wrong, please try again later.")
            Button {
                action()
            } label: {
                PixelText(configuration: .retry, text: "Retry")
                    .padding(.vertical, .p3)
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .fill(.white)
                    )
            }
            .buttonStyle(DecreaseSizeButtonStyle())
        }
        .padding(.horizontal, .p20)
    }
}

fileprivate extension PixelTextConfiguration {

    static var error: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big1),
              lineLimit: 2)
    }

    static var retry: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.dark8),
              fontStyle: .single(font: .medium1))
    }
}

#Preview {

    ErrorView(action: {print("test")})
}
