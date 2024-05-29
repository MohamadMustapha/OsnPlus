//
//  ItemsGridView.swift
//
//
//  Created by Mohamad Mustapha on 28/05/2024.
//

import Pixel
import SwiftUI

public struct ItemsGridView: View {

    let items: [ItemModel]
    private let columns: [GridItem] = [.init(.flexible(), spacing: .p3, alignment: .top),
                                       .init(.flexible(), spacing: .p3, alignment: .top),
                                       .init(.flexible(), spacing: .p3, alignment: .top)]

    public init(items: [ItemModel]) {
        self.items = items
    }

    public var body: some View {
        LazyVGrid(columns: columns, spacing: .p3) {
            ForEach(items) { item in
                ItemCardView(item: item)
            }
        }
    }
}

#Preview {

    ItemsGridView(items: [.mock, .mock, .mock])
}
