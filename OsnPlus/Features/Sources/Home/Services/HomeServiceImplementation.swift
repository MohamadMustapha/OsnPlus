//
//  HomeServiceImplementation.swift
//
//
//  Created by Mohamad Mustapha on 24/05/2024.
//

import OSNCore
import OSNNetwork
import Foundation

struct HomeServiceImplementation: HomeService {

    let api: HttpMoviesApi

    init(api: HttpMoviesApi) {
        self.api = api
    }

    func getMustWatch() async throws -> [ItemModel] {
        return try await fetch(using: api.getMustWatch, upTo: 2)
    }
    
    func getTrending() async throws -> [ItemModel] {
        return try await fetch(using: api.getTrending, upTo: 2)
    }
    
    func getComingSoon() async throws -> [ItemModel] {
        return try await fetch(using: api.getComingSoon)
    }
    
    func getBlockBuster() async throws -> [ItemModel] {
        return try await fetch(using: api.getBlockBuster, upTo: 2)
    }
    
    func getJustAdded() async throws -> [ItemModel] {
        return try await fetch(using: api.getJustAdded)
    }

    private func fetch(using method: @escaping (_ pages: Int) async throws -> MovieResponse, upTo pages: Int = 1) async throws-> [ItemModel] {
        var items: [ItemModel] = []
        items.reserveCapacity(pages*20)

        if pages == 1 {
            return parse(from: try await method(pages))
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
                                        items.append(contentsOf: parse(from: response))
                                    }
                                    return items
                                }
            )
            return items
        }
    }

    private func parse(from response: MovieResponse) -> [ItemModel] {
        return response.results.map { .init(id: $0.id,
                                            imageUrl: api.generateImageUrl(from: $0.posterPath),
                                            title: $0.title)
        }
    }
}
