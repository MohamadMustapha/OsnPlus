//
//  SearchPopularTitlesModel.swift
//
//
//  Created by Mohamad Mustapha on 07/09/2024.
//

import Foundation

public struct SearchPopularTitlesModel: Identifiable {

    public let id: UUID = .init()

    public let titles: [String]

    public init(titles: [String]) {
        self.titles = titles
    }
}
