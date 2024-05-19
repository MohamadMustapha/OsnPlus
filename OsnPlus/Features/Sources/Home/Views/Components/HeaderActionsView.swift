//
//  HeaderActionsView.swift
//
//
//  Created by Mohamad Mustapha on 19/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct HeaderActionsView: View {

    let item: HeaderModel

    var body: some View {
        VStack(spacing: .p7) {
            PixelText(configuration: .genres, text: (item.genres.joined(separator: " · ")) )

            HStack(alignment: .center, spacing: .p2) {
                Button {
                    // TODO: implement navigation to details
                } label: {
                    icon(name: "info.circle")
                        .transparentButtonStyle(colorStyle: actions, type: .circle)
                }
                .buttonStyle(DecreaseSizeButtonStyle())

                Button {

                } label: {
                    HStack(alignment: .center, spacing: .p4) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(play.color)
                            .frame(width: 14 ,height: 14)

                        PixelText(configuration: .play, text: "PLAY NOW")

                    }
                    .padding(.vertical, .p5)
                    .padding(.horizontal, .p15)
                    .background(
                        Capsule()
                            .fill(actions.color)
                    )
                }
                .buttonStyle(DecreaseSizeButtonStyle())

                Button {
                    // TODO implement adding to favorites
                } label: {
                    icon(name: "plus")
                        .transparentButtonStyle(colorStyle: actions, type: .circle)
                }
                .buttonStyle(DecreaseSizeButtonStyle())
            }
        }
    }

    private var actions: PixelColorStyle {
        .single(color: PixelColor.light1)
    }
    private var play: PixelColorStyle {
        .single(color: PixelColor.dark8)
    }

    @ViewBuilder
    private func icon(name: String) -> some View{
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .foregroundStyle(actions.color)
            .fontWeight(.light)
            .frame(width: 15, height: 15)
            .padding(.p1)
    }
}

fileprivate extension PixelTextConfiguration {

    static var genres: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .small2),
              lineLimit: 1)
    }

    static var play: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.dark8),
              fontStyle: .single(font: .medium1),
              lineLimit: 1)
    }

}

#Preview {
    HeaderActionsView(item: .init(id: 1,
                                  imageUrl: "",
                                  genres: ["Drama", "Crime"]))
}
