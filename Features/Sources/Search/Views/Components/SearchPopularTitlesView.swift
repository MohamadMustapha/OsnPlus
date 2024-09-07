//
//  SearchPopularTitlesView.swift
//
//
//  Created by Mohamad Mustapha on 07/09/2024.
//

import Pixel
import SwiftUI

public struct SearchPopularTitlesView: View {

    public typealias Model = SearchPopularTitlesModel

    @Binding public var searchText: String

    let item: Model

    public init(searchText: Binding<String>, item: Model) {
        self._searchText = searchText
        self.item = item
    }

    public var body: some View {
        HStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: .p7) {
                    PixelText(configuration: .title, text: "Popular titles")
                    ForEach(item.titles, id: \.self) { item in
                        Button {
                            searchText = item
                        } label: {
                            PixelText(configuration: .popular, text: item)
                        }
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)

            Spacer()
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var title: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big2),
              lineLimit: 1)
    }

    static var popular: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light8),
              fontStyle: .single(font: .dino5),
              lineLimit: 1)

    }
}
#Preview {

    SearchPopularTitlesView(searchText: .constant("Game of Thrones"), item: .init(titles: ["Game Of Thrones",
                                                  "House Of The Dragon",
                                                  "From",
                                                  "Ikhwati"]))
}
