//
//  File.swift
//  
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public enum ApiError: Error {
    case invalidUrl
    case requestFailed(description: String)
    case invalidData
    case statusCodeNotOk(description: String)
    case jsonConversionFailure(description: String)
    case jsonParsingFailure

 var customDescription: String {
  switch self {
    case .invalidUrl: return "Invalid Url, check the generateUrl function and the parameters passed"
    case let .requestFailed(description): return "Request Failed: \(description)"
    case .invalidData: return "Invalid Data"
    case let .statusCodeNotOk(description): return "Status Code: \(description)"
    case let .jsonConversionFailure(description): return "JSON Conversion Failure: \(description)"
    case .jsonParsingFailure: return "JSON Parsing Failure"
  }
 }
}

public protocol Api {
    var session: URLSession { get }

    func fetch<T:Codable>(type: T.Type, with request: URLRequest) async throws -> T
    func generateUrlRequest(from url: URL) throws -> URLRequest
    func generateUrlString(route: String, endpoint: String) throws-> URL

}

public extension Api {

    private var baseUrl: String {"https://api.themoviedb.org/3"}
    private var baseImageUrl: String {"https://image.tmdb.org/t/p/w500"}
    private var authorizationKey: String {"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODllMzkxMmNlZDUyYzRiMzIyMDM2MTZlN2MyMTc1ZiIsInN1YiI6IjY1N2I1YTU3YTFkMzMyMjllM2E5NmFmMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B93MOMcqizdiWvw9L8KBFd14PcJL-FZ-7K1BcUIHz08"}

    func fetch<T:Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        let (data, response): (Data, URLResponse) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {throw ApiError.requestFailed(description: "Invalid response")}
        guard (200...299).contains(httpResponse.statusCode) else {throw ApiError.statusCodeNotOk(description: httpResponse.statusCode.description)}

        return try JSONDecoder().decode(type, from: data)
    }


    func generateUrlRequest(from url: URL, pages: Int, query: String?) throws -> URLRequest {
        guard var components: URLComponents = .init(url: url, resolvingAgainstBaseURL: true) else {throw ApiError.invalidUrl}

        var queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: pages.description ),
        ]
        if let query = query {
            queryItems.append(.init(name: "query", value: query))
        }

        components.queryItems = components.queryItems.map { $0 + queryItems }

        guard let url: URL = components.url else {throw ApiError.invalidUrl}
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": authorizationKey
        ]
        return request
    }

    func generateUrlString(route: String, endpoint: String) throws -> URL {
        guard let url: URL = .init(string: "\(baseUrl)/\(route)/\(endpoint)") else {throw ApiError.invalidUrl}
        return url
    }

}
