//
//  MoviesServiceImplementation.swift
//
//
//  Created by Mohamad Mustapha on 03/06/2024.
//

import Foundation
import OSNCore
import OSNNetwork

struct MoviesServiceImplementation: MoviesService {

    let api: MoviesApi

    public init(api: MoviesApi) {
        self.api = api
    }

    func getMustWatch() async throws -> [ItemModel] {
        return try await fetch(upTo: 2, using: api.getMustWatch)
    }

    func getTrending() async throws -> [ItemModel] {
        return try await fetch(upTo: 2, using: api.getTrending)
    }

    func getComingSoon() async throws -> [ItemModel] {
        return try await fetch(using: api.getComingSoon)
    }

    func getBlockBuster() async throws -> [ItemModel] {
        return try await fetch(upTo: 2, using: api.getBlockBuster)
    }

    func getJustAdded() async throws -> [ItemModel] {
        return try await fetch(using: api.getJustAdded)
    }

    func getTopMovies() async throws -> [ItemModel] {
        return try await fetch(using: api.getTopMovies)
    }

    private func fetch(upTo pages: Int = 1, using method: @escaping (_ pages: Int) async throws -> MovieResponse) async throws-> [ItemModel] {
        var items: [ItemModel] = []
        items.reserveCapacity(pages*20)

        if pages == 1 {
            return try  parse(from: try await method(pages))
        } else {
            items.append(contentsOf:
                            try await withThrowingTaskGroup(
                                of: MovieResponse.self,
                                returning: [ItemModel].self) { taskGroup in
                                    for page in 1...pages {
                                        taskGroup.addTask {
                                            let response = try await method(page)
                                            return response
                                        }
                                    }
                                    var items: [ItemModel] = []
                                    while let response: MovieResponse = try await taskGroup.next() {
                                        items.append(contentsOf: try parse(from: response))
                                    }
                                    return items
                                }
            )
            return items
        }
    }

    private func parse(from response: MovieResponse) throws -> [ItemModel] {
        return try response.results.map { .init(id: $0.id,
                                            imageUrl: try api.generateImageUrl(from: $0.posterPath ?? ""),
                                                title: $0.title ?? "",
                                                popularity: $0.popularity ?? 0)
        }
    }
}
