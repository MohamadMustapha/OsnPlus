//
//  MovieResponse.swift
//
//
//  Created by Mohamad Mustapha on 23/05/2024.
//

import Foundation

public struct MovieResponse: Codable {

    public let page: Int
    public let results: [Movie]
}

public struct Movie: Codable, Identifiable {

    public let id: Int

    public let posterPath: String
    public let title: String
}
