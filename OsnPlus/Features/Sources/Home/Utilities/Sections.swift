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
    case trending = "Trending on OSN+"
    case comingSoon = "Coming Soon"
    case blockBuster = "Blockbuster Movies"
    case justAdded = "Just Added"
    case topMovies = "Top 10 Movies in Lebanon"

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
            return try await service.getMustWatch()
        case .trending:
            return try await service.getTrending()
        case .comingSoon:
            return try await service.getComingSoon()
        case .blockBuster:
            return try await service.getBlockBuster()
        case .justAdded:
            return try await service.getJustAdded()
        case .topMovies:
            return try await service.getTopMovies()
        }
    }
}