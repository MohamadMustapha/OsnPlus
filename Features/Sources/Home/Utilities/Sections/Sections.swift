//
//  Sections.swift
//
//
//  Created by Mohamad Mustapha on 25/05/2024.
//

import OSNCore
import Foundation

protocol Section {

    var rawValue: String { get }
    var type: ItemsCarouselModel.CarouselType { get }
    func fetch(using service: HomeServiceImplementation) async throws -> [ItemModel]
}

enum Category: String {
    case movies = "Movies"
    case series = "Series"
}
