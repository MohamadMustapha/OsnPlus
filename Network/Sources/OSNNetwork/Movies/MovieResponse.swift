//
//  ItemResponse.swift
//
//
//  Created by Mohamad Mustapha on 01/06/2024.
//

import Foundation

public struct MovieResponse: Codable {

    public let page: Int
    public let results: [Movie]
}

public struct Movie: Identifiable, Codable {

    public let id: Int

    public let posterPath: String?
    public let title: String?
}
