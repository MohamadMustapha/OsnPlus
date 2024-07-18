//
//  SeriesResponse.swift
//
//
//  Created by Mohamad Mustapha on 04/06/2024.
//

import Foundation

public struct SeriesResponse: Codable {

    public let page: Int
    public let results: [Series]
}

public struct Series: Identifiable, Codable {

    public let id: Int

    public let posterPath: String?
    public let name: String?
    public let popularity: Double?
}
