//
//  SearchService.swift
//
//
//  Created by Mohamad Mustapha on 05/06/2024.
//

import Foundation
import OSNCore

protocol SearchService {

    func getAllTrending() async throws -> [ItemModel]

    func searchQuery(query: String) async throws -> [ItemModel]
}
