//
//  ItemsCarouselView.swift
//
//
//  Created by Mohamad Mustapha on 20/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct ItemsCarouselView: View {

    let carousel: ItemsCarouselModel

    var body: some View {
        VStack(alignment: .leading) {
            PixelText(configuration: .headline, text: carousel.headline)
                .padding(.horizontal, .p10)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible(), alignment: .top)], spacing: isCharts ? .p12 : .p3) {
                    ForEach(Array(carousel.items.enumerated()), id: \.element.id) { index, item in
                        ZStack(alignment: .bottomLeading) {
                            ItemCardView(item: item)

                            Text((index + 1).description)
                                .fontWeight(.bold)
                                .font(.system(size: 90))
                                .foregroundStyle(PixelColor.light1)
                                .offset(x: -28, y: 10)
                                .isHidden(!isCharts, remove: !isCharts)
                        }
                    }
                    .containerRelativeFrame(.horizontal,
                                            count: isCharts ? 11 : 10,
                                            span: isCharts ? 4 : 3,
                                            spacing: .p0)
                }
            }
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            .safeAreaPadding(.horizontal, .p10)
        }
    }

    private var isCharts: Bool {
        carousel.type == .charts
    }
}

fileprivate extension PixelTextConfiguration {

    static var headline: PixelTextConfiguration {
        .init(alignment: .leading,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big2),
              lineLimit: 1)
    }
}

#Preview {
    VStack(spacing: .p5) {
        ItemsCarouselView(carousel: .init(type: .plain, headline: "Must Watch", items: [.mock,
                                                                                        .mock,
                                                                                        .mock,
                                                                                        .mock,
                                                                                        .mock]))

        ItemsCarouselView(carousel: .init(type: .charts, headline: "Top 10 in Lebanon", items: [.mock,
                                                                                        .mock,
                                                                                        .mock,
                                                                                        .mock,
                                                                                        .mock]))
    }

}
