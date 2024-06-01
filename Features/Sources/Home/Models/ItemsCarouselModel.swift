//
//  ItemsCarouselModel.swift
//
//
//  Created by Mohamad Mustapha on 20/05/2024.
//

import Foundation
import OSNCore

struct ItemsCarouselModel: Identifiable {

    enum CarouselType {
        case charts, plain
    }

    let id: UUID = .init()
    
    let type: CarouselType
    let headline: String
    let items: [ItemModel]

}

