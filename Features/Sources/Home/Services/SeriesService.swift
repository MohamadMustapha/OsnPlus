//
//  SeriesService.swift
//
//
//  Created by Mohamad Mustapha on 03/06/2024.
//

import Foundation
import OSNCore
import OSNNetwork

public protocol SeriesService {

    var api: SeriesApi { get }

    // Trending
    func getTrending() async throws -> [ItemModel]
    // Top Rated
    func getTopHits() async throws -> [ItemModel]

    func searchSeries(query: String) async throws -> [ItemModel]
}
