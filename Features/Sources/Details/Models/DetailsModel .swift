//
//  DetailsModel .swift
//
//
//  Created by Mohamad Mustapha on 06/08/2024.
//

import Foundation

public struct DetailsModel: Identifiable {

    public let id: Int

    let title: String
    let description: String
    let imageURL: String
    let genres: [String]
    let year: Int
    let runtime: Int

    public init(id: Int, title: String, description: String, imageURL: String, genres: [String], year: Int, runtime: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.genres = genres
        self.year = year
        self.runtime = runtime
    }
}
