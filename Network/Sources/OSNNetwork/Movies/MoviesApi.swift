//
//  MoviesApi.swift
//  
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public protocol MoviesApi: Api {

    // Popular
    func getMustWatch(pages: Int) async throws -> MovieResponse
    // Trending
    func getTrending(pages: Int) async throws ->  MovieResponse
    // Upcoming
    func getComingSoon(pages: Int) async throws ->  MovieResponse
    // Top Rated
    func getBlockBuster(pages: Int) async throws ->  MovieResponse
    // Now Playing
    func getJustAdded(pages: Int) async throws ->  MovieResponse
    // Popular but only first 10
    func getTopMovies(pages: Int) async throws ->  MovieResponse
//    func getDetails(by id: Int) async throws ->
    func getMovieHeader(by id: Int) async throws -> HeaderResponse

    func searchMovies(pages: Int, query: String) async throws ->  MovieResponse

}
