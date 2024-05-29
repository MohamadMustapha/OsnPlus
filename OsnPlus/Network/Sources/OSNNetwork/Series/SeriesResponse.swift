//
//  File.swift
//  
//
//  Created by Mohamad Mustapha on 29/05/2024.
//

import Foundation

public struct SeriesResponse: Codable {

    public let page: Int
    public let results: [Series]
}

public struct Series: Codable, Identifiable {

    public let id: Int

    public let poster_path: String
    public let name: String
}
