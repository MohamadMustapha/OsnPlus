//
//  MovieSections.swift
//
//
//  Created by Mohamad Mustapha on 19/06/2024.
//

import Foundation
import OSNCore

enum MovieSections: String, CaseIterable, Section {

    case mustWatch = "Must Watch"
    case trending = "Trending On OSN+"
    case comingSoon = "Coming Soon"
    case blockBuster = "Blockbuster Movies"
    case justAdded = "Just Added"
    case topMovies = "Top 10 Movies In Lebanon"

    var type: ItemsCarouselModel.CarouselType {
        switch self {
        case .topMovies:
                .charts
        default:
                .plain
        }
    }

    func fetch(using service: HomeServiceImplementation) async throws -> [ItemModel] {
        switch self {
        case .mustWatch:
            return try await service.moviesService.getMustWatch()
        case .trending:
            return try await service.moviesService.getTrending()
        case .comingSoon:
            return try await service.moviesService.getComingSoon()
        case .blockBuster:
            return try await service.moviesService.getBlockBuster()
        case .justAdded:
            return try await service.moviesService.getJustAdded()
        case .topMovies:
            return try await service.moviesService.getTopMovies()
        }
    }
}
