//
//  ItemCardView.swift
//
//
//  Created by Mohamad Mustapha on 20/05/2024.
//

import Kingfisher
import Pixel
import SwiftUI

public struct ItemCardView: View {

    @State var isPresented: Bool = false

    let item: ItemModel

    public init(item: ItemModel) {
        self.item = item
    }

    public var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            KFImage(.init(string: item.imageUrl))
                .placeholder {
                    PixelText(configuration: .caption, text: item.title)
                }
                .fade(duration: 0.5)
                .forceTransition(true)
                .resizable()
                .aspectRatio(27/40, contentMode: .fit)
                .background(PixelColor.dark6)
                .clipShape(RoundedRectangle(cornerRadius: .p2))
        }
        .buttonStyle(DecreaseSizeButtonStyle())
        .sheet(isPresented: $isPresented) {
            Text(item.title)
                .presentationDetents([.fraction(0.99)])
                .presentationDragIndicator(.hidden)
                .presentationBackgroundInteraction(.disabled)
                .presentationBackground(PixelColor.dark7)
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var caption: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light8),
              fontStyle: .single(font: .medium3),
              lineLimit: 2)
    }
}

#Preview {
    HStack(spacing: .p5) {
        ItemCardView(item: .init(id: 1,
                                 imageUrl: "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
                                 title: "Dune",
                                 popularity: 0))
    }
    .padding()

}
