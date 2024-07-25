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
    // Popular
    func getTopSeries(pages: Int) async throws -> SeriesResponse
    // Just Added
    func getJustAdded(pages: Int) async throws -> SeriesResponse
    // Header
    func getSeriesHeader(by id: Int) async throws -> HeaderResponse
    // Search
    func searchSeries(pages: Int, query: String) async throws -> SeriesResponse
}
