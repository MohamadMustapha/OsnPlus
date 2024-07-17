//
//  SeriesSection.swift
//  
//
//  Created by Mohamad Mustapha on 19/06/2024.
//

import Foundation
import OSNCore

enum SeriesSections: String, CaseIterable, Section {

    case trending = "Trending On OSN+"
    case boxSets = "Boxsets To Binge On"

    var type: ItemsCarouselModel.CarouselType {
        switch self {
        default: .plain
        }
    }

    func fetch(using service: HomeServiceImplementation) async throws -> [ItemModel] {
        switch self {
        case .trending:
            return try await service.seriesService.getTrending()
        case .boxSets:
            return try await service.seriesService.getTopHits()
        }
    }
}
