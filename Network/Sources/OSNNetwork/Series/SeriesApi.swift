//
//  SeriesApi.swift
//
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public protocol SeriesApi: Api {

    // Trending
    func getTrending(pages: Int) async throws -> SeriesResponse
    // Top Rated
    func getTopHits(pages: Int) async throws -> SeriesResponse

    func searchSeries(pages: Int, query: String) async throws -> SeriesResponse
}
