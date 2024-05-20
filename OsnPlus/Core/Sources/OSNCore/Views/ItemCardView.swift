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

    let item: ItemModel

    public init(item: ItemModel) {
        self.item = item
    }

    public var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(.init(string: item.imageUrl))
                .placeholder {
                    PixelText(configuration: .title, text: item.title)
                }
                .fade(duration: 0.5)
                .forceTransition(true)
                .resizable()
                .aspectRatio(27/40, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: .medium))
                .background(PixelColor.dark6)

            if let rank = item.rank {
                Text(rank.description)
                    .fontWeight(.bold)
                    .font(.system(size: 90))
                    .foregroundStyle(PixelColor.light1)
                    .offset(x: -30, y: 10)
            }
        }
    }
}

fileprivate extension PixelTextConfiguration {
    static var title: PixelTextConfiguration {
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
                                 type: .plain))

        ItemCardView(item: .init(id: 1,
                                 imageUrl: "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIck.jpg",
                                 title: "Dune but very long to test way too long more long  even more long ",
                                 type: .charts(rank: 3)))
    }
    .padding()

}
