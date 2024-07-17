//
//  ItemModel.swift
//
//
//  Created by Mohamad Mustapha on 20/05/2024.
//

import Foundation

public struct ItemModel: Identifiable {

    public let id: Int

    public let imageUrl: String
    public let title: String
    public let popularity: Double

    public init(id: Int, imageUrl: String, title: String, popularity: Double) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.popularity = popularity
    }

    public static let mock: Self = .init(id: 1,
                                         imageUrl: "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
                                         title: "Dune",
                                         popularity: 10
    )
}
