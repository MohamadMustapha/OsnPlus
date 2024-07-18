//
//  File.swift
//  
//
//  Created by Mohamad Mustapha on 18/07/2024.
//

import Foundation

public struct HeaderResponse: Identifiable, Codable {

    public let id: Int

    public let posterPath: String
    public let genres: [Genre]
}

public struct Genre: Identifiable, Codable {

    public let id: Int
    public let name: String
}
