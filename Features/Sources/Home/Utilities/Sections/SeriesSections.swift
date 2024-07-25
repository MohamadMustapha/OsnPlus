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
    case topSeries = "Top 10 Series in Lebanon"
    case justAdded = "Just Added"

    var type: ItemsCarouselModel.CarouselType {
        switch self {
        case .topSeries:
                .charts
        default: .plain
        }
    }

    func fetch(using service: HomeServiceImplementation) async throws -> [ItemModel] {
        switch self {
        case .trending:
            return try await service.seriesService.getTrending()
        case .boxSets:
            return try await service.seriesService.getTopHits()
        case .topSeries:
            return try await service.seriesService.getTopSeries()
        case .justAdded:
            return try await service.seriesService.getJustAdded()
        }
    }
}
