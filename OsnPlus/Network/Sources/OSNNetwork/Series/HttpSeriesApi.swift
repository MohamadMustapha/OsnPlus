//
//  HttpSeriesApi.swift
//
//
//  Created by Mohamad Mustapha on 29/05/2024.
//

import Foundation

public struct HttpSeriesApi: SeriesApi {

    public init() { }

    func searchSeries(pages: Int = 1, query: String) async throws -> SeriesResponse {
        return try await fetch(type: SeriesResponse.self, with: generateUrlRequest(from: generateUrl(route: "search", endpoint: "tv"), pages: pages, query: query))
    }
}
