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
        default: .plain
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

enum SeriesSection: String, CaseIterable, Section {

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
