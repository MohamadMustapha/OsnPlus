//
//  EmptyListView.swift
//
//
//  Created by Mohamad Mustapha on 04/08/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(alignment: .center, spacing: .p10) {
            Image(systemName: "square.fill.on.square.fill")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(90))
                .frame(width: 25, height: 25)
                .padding(.bottom, .p5)

            PixelText(configuration: .empty, text: "It's looking a bit empty in here")

            PixelText(configuration: .save, text: "Use My List to save your favorites, recommendations, and future watches.")

            Button {
                // TODO: implement redirection to HomeView
                print("HomeView")
            } label: {
                PixelText(configuration: .explore, text: "Let's explore")
                    .padding(.vertical, .p5)
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .fill(PixelColor.light1)
                    )
            }
            .buttonStyle(DecreaseSizeButtonStyle())
        }
        .padding(.horizontal, 50)
    }
}

fileprivate extension PixelTextConfiguration {
    
    static var empty: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.big1))
    }

    static var save: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light8),
              fontStyle: .single(font: PixelFont.big4))
    }

    static var explore: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.dark8),
              fontStyle: .single(font: PixelFont.big2))
    }
}

#Preview {
    EmptyListView()
}
