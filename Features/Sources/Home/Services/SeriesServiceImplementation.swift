//
//  SeriesServiceImplementation.swift
//
//
//  Created by Mohamad Mustapha on 03/06/2024.
//

import Foundation
import OSNCore
import OSNNetwork

struct SeriesServiceImplementation: SeriesService {

    let api: SeriesApi

    public init(api: SeriesApi) {
        self.api = api
    }

    func getTrending() async throws -> [ItemModel] {
        return try await fetch(upTo: 2, using: api.getTrending)
    }
    
    func getTopHits() async throws -> [ItemModel] {
        return try await fetch(upTo: 2, using: api.getTopHits)
    }

    func getTopSeries() async throws -> [ItemModel] {
        return try await fetch(using: api.getTopSeries)
    }

    func getJustAdded() async throws -> [ItemModel] {
        return try await fetch(using: api.getJustAdded)
    }


    func getSeriesHeader(by id: Int) async throws -> HeaderModel {
        return try await parseHeader(from: api.getSeriesHeader(by: id))
    }

    private func fetch(upTo pages: Int = 1, using method: @escaping (_ pages: Int) async throws -> SeriesResponse) async throws-> [ItemModel] {
        var items: [ItemModel] = []
        items.reserveCapacity(pages*20)

        if pages == 1 {
            return try parse(from: try await method(pages))
        } else {
            items.append(contentsOf:
                            try await withThrowingTaskGroup(
                                of: SeriesResponse.self,
                                returning: [ItemModel].self) { taskGroup in
                                    for page in 1...pages {
                                        taskGroup.addTask {
                                            let response = try await method(page)
                                            return response
                                        }
                                    }
                                    var items: [ItemModel] = []
                                    while let response: SeriesResponse = try await taskGroup.next() {
                                        items.append(contentsOf: try parse(from: response))
                                    }
                                    return items
                                }
            )
            return items
        }
    }

    private func parse(from response: SeriesResponse) throws -> [ItemModel] {
        return try response.results.map { .init(id: $0.id,
                                            imageUrl: try api.generateImageUrl(from: $0.posterPath ?? ""),
                                            title: $0.name ?? "",
                                                popularity: $0.popularity ?? 0)
        }
    }

    private func parseHeader(from response: HeaderResponse) throws -> HeaderModel {
        return try .init(id: response.id,
                         imageUrl: api.generateImageUrl(from: response.posterPath),
                         genres: response.genres.map {$0.name}.prefix(3).joined(separator: " · "))
    }
}
