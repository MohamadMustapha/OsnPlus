//
//  SearchServiceImplementation.swift
//
//
//  Created by Mohamad Mustapha on 05/06/2024.
//

import Foundation
import OSNCore
import OSNNetwork

struct SearchServiceImplementation: SearchService {

    let moviesApi: MoviesApi
    let seriesApi: SeriesApi

    init(moviesApi: MoviesApi, seriesApi: SeriesApi) {
        self.moviesApi = moviesApi
        self.seriesApi = seriesApi
    }

    func getAllTrending() async throws -> [ItemModel] {
        async let series: [ItemModel] = parseSeries(from: seriesApi.getTrending(pages: 1))
        async let movies: [ItemModel] = parseMovies(from: moviesApi.getTrending(pages: 1))

        return (try await series + movies).shuffled()
    }
    
    func searchQuery(query: String) async throws -> [ItemModel] {
        async let series: [ItemModel] = parseMovies(from: moviesApi.searchMovies(pages: 1, query: query))
        async let movies: [ItemModel] = parseSeries(from: seriesApi.searchSeries(pages: 1, query: query))

        return (try await series + movies).shuffled()
    }

    private func parseSeries(from response: SeriesResponse) throws -> [ItemModel] {
        return try response.results.map { .init(id: $0.id,
                                            imageUrl: try seriesApi.generateImageUrl(from: $0.posterPath),
                                            title: $0.name)
        }
    }

    private func parseMovies(from response: MovieResponse) throws -> [ItemModel] {
        return try response.results.map { .init(id: $0.id,
                                            imageUrl: try moviesApi.generateImageUrl(from: $0.posterPath),
                                            title: $0.title)
        }
    }
}
