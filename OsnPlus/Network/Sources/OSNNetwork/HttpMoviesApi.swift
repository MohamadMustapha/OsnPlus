//
//  HttpMoviesApi.swift
//
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public struct HttpMoviesApi: MoviesApi {

    public init() { }

    public func getMustWatch(pages: Int = 1) async throws -> MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie", endpoint: "popular"), pages: pages))
    }
    
    public func getTrending(pages: Int = 1) async throws -> MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "trending", endpoint: "movie/day"), pages: pages))
    }
    
    public func getComingSoon(pages: Int = 1) async throws -> MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie", endpoint: "upcoming"), pages: pages))
    }
    
    public func getBlockBuster(pages: Int = 1) async throws -> MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie", endpoint: "top_rated"), pages: pages))
    }
    
    public func getJustAdded(pages: Int = 1) async throws -> MovieResponse {
        return try await fetch(type: MovieResponse.self, with: generateUrlRequest(from: generateUrl(route: "movie", endpoint: "now_playing"), pages: pages))
    }
}
