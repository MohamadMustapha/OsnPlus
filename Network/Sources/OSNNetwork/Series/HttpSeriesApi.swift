//
//  HttpSeriesApi.swift
//
//
//  Created by Mohamad Mustapha on 29/05/2024.
//

import Foundation

public struct HttpSeriesApi: SeriesApi {

    public init() { }

    // MARK: Home
    public func getTrending(pages: Int) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "trending",
                                                                                                     endpoint: "tv/week"),
                                                                                   pages: pages))
    }

    public func getTopHits(pages: Int) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "tv",
                                                                                                     endpoint: "top_rated"),
                                                                                   pages: pages))
    }

    public func getSeriesHeader(by id: Int) async throws -> HeaderResponse {
        return try await fetch(type: HeaderResponse.self, with: generateUrlRequest(from: generateUrl(route: "tv",
                                                                                                     endpoint: id.description)))
    }

    // MARK: Search
    public func searchSeries(pages: Int, query: String) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "search",
                                                                                                     endpoint: "tv"),
                                                                                   pages: pages,
                                                                                   parameters: [.init(name: "query",
                                                                                                      value: query)]))
    }
}
