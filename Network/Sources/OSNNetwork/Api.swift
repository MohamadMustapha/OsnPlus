//
//  Api.swift
//
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

public enum ApiError: Error {

    case invalidUrl
    case invalidImageUrl
    case requestFailed
    case statusCodeNotOk(description: String)

 var customDescription: String {
  switch self {
    case .invalidUrl: return "Invalid Url, check the generateUrl function and the parameters passed"
    case .invalidImageUrl: return "Invalid Image path, check generateImageUrl function"
    case .requestFailed: return "Request Failed: Invalid response "
    case let .statusCodeNotOk(description): return "Status Code: \(description)"
  }
 }
}

public protocol Api {

    func fetch<T:Codable>(type: T.Type, with request: URLRequest) async throws -> T
    func generateUrlRequest(from url: URL, pages: Int?, parameters: [URLQueryItem]?) throws -> URLRequest
    func generateUrl(route: String, endpoint: String) throws -> URL
    func generateImageUrl(from path: String) throws -> String
}

public extension Api {

    private var baseUrl: String {"https://api.themoviedb.org/3"}
    private var baseImageUrl: String {"https://image.tmdb.org/t/p/w500"}
    private var authorizationKey: String {"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODllMzkxMmNlZDUyYzRiMzIyMDM2MTZlN2MyMTc1ZiIsInN1YiI6IjY1N2I1YTU3YTFkMzMyMjllM2E5NmFmMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B93MOMcqizdiWvw9L8KBFd14PcJL-FZ-7K1BcUIHz08"}

    func fetch<T:Codable>(type: T.Type, with request: URLRequest) async throws -> T {
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {throw ApiError.requestFailed}
        guard (200...299).contains(httpResponse.statusCode) else {throw ApiError.statusCodeNotOk(description: httpResponse.statusCode.description)}

        let decoder: JSONDecoder = .init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }


    func generateUrlRequest(from url: URL, pages: Int? = nil, parameters: [URLQueryItem]? = nil) throws -> URLRequest {
        guard var components: URLComponents = .init(url: url, resolvingAgainstBaseURL: true) else {throw ApiError.invalidUrl}

        components.queryItems = [
          URLQueryItem(name: "language", value: "en-US")
        ]

        if let parameters = parameters {
            components.queryItems?.append(contentsOf: parameters)
        }
        if let pages = pages {
            components.queryItems?.append(.init(name: "page", value: pages.description ))
        }

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

    func generateUrl(route: String, endpoint: String) throws -> URL {
        guard let url: URL = .init(string: "\(baseUrl)/\(route)/\(endpoint)") else {throw ApiError.invalidUrl}
        return url
    }

    func generateImageUrl(from path: String) -> String {
        return "\(baseImageUrl)/\(path)s"
    }
}
