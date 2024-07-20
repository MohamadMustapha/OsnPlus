//
//  HttpMoviesApi.swift
//
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public struct HttpMoviesApi: MoviesApi {

    public init() { }

    // MARK: Home
    public func getMustWatch(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie", endpoint: "popular"),
                                                                                  pages: pages))
    }
    
    public func getTrending(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "trending",
                                                                                                    endpoint: "movie/day"),
                                                                                  pages: pages))
    }
    
    public func getComingSoon(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie",
                                                                                                    endpoint: "upcoming"),
                                                                                  pages: pages))
    }
    
    public func getBlockBuster(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie",
                                                                                                    endpoint: "top_rated"),
                                                                                  pages: pages))
    }
    
    public func getJustAdded(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie",
                                                                                                    endpoint: "now_playing"),
                                                                                  pages: pages))
    }

    public func getTopMovies(pages: Int) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie",
                                                                                                    endpoint: "popular"),
                                                                                  pages: pages))
    }

    public func getMovieHeader(by id: Int) async throws -> HeaderResponse {
        return try await fetch(type: HeaderResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie",
                                                                                                     endpoint: id.description)))
    }

    // MARK: Search
    public func searchMovies(pages: Int = 1, query: String) async throws ->  MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "search",
                                                                                                    endpoint: "movie"),
                                                                                  pages: pages,
                                                                                  parameters: [.init(name: "query", value: query)]))
    }

    //MARK: Details

}
