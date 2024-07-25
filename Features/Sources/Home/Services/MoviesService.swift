//
//  MoviesService.swift
//
//
//  Created by Mohamad Mustapha on 03/06/2024.
//

import OSNCore
import OSNNetwork
import Foundation

public protocol MoviesService {

    var api: MoviesApi { get }

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
    // Top Grossing
    func getTopGrossing() async throws -> [ItemModel] 
    // Header
    func getMovieHeader(by id: Int) async throws -> HeaderModel
}
