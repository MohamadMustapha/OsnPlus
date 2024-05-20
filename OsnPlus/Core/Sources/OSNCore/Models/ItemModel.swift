//
//  ItemModel.swift
//
//
//  Created by Mohamad Mustapha on 20/05/2024.
//

import Foundation

public struct ItemModel: Identifiable {

    public enum CardType {

        case charts(rank: Int), plain
    }

    public let id: Int

    public let imageUrl: String
    public let title: String
    public let type: CardType
    public var rank: Int? {
        if case let .charts(rank) = type {
            return rank
        }
        return nil
    }

    public init(id: Int, imageUrl: String, title: String, type: CardType) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.type = type
    }
}
