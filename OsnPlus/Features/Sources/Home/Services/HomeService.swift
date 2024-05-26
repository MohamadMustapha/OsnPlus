//
//  HomeService.swift
//
//
//  Created by Mohamad Mustapha on 23/05/2024.
//

import OSNCore
import OSNNetwork
import Foundation

protocol HomeService {

    // Popular
    func getMustWatch() async throws -> [ItemModel]
    // Trending
    func getTrending() async throws -> [ItemModel]
    // Upcoming
    func getComingSoon() async throws -> [ItemModel]
    // Top Rated
    func getBlockBuster() async throws -> [ItemModel]
    // Now Playing
    func getJustAdded() async throws -> [ItemModel]
    // Popular
    func getTopMovies() async throws -> [ItemModel]
}
