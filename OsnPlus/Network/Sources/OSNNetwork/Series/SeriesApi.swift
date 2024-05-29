//
//  SeriesApi.swift
//  
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import Foundation

protocol SeriesApi: Api {

    func searchSeries(pages: Int, query: String) async throws -> SeriesResponse
}
