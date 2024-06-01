//
//  TopBarView.swift
//
//
//  Created by Mohamad Mustapha on 19/05/2024.
//

import Pixel
import SwiftUI

public struct TopBarView: View {

    let name: String

    public init(name: String) {
        self.name = name
    }

    public var body: some View {
        HStack(spacing: .p5) {
            Image("osn-logo", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)

            Button {

            } label: {
                HStack(spacing: .p4) {
                    PixelText(configuration: .name, text: name)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(nameButtonStyle.color)
                        .fontWeight(.semibold)
                        .frame(width: 11, height: 11)
                        .offset(y: 2)
                }
            }
            .buttonStyle(DecreaseSizeButtonStyle())

            Spacer()
        }
        .padding(.horizontal, .p10)
    }

    private var nameButtonStyle: PixelColorStyle {
        .single(color: PixelColor.light1)
    }
}

fileprivate extension PixelTextConfiguration {

    static var name: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .dino4))
    }
}

#Preview {
    TopBarView(name: "Mohamad")
}
