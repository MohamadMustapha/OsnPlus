//
//  HttpSeriesApi.swift
//
//
//  Created by Mohamad Mustapha on 29/05/2024.
//

import Foundation

public struct HttpSeriesApi: SeriesApi {

    public init() { }

    public func getTrending(pages: Int = 1) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "trending", endpoint: "tv/week"), pages: pages))
    }

    public func getTopHits(pages: Int = 1) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "tv", endpoint: "top_rated"), pages: pages))
    }

    public func searchSeries(pages: Int = 1, query: String) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "search", endpoint: "tv"), pages: pages, query: query))
    }
}
