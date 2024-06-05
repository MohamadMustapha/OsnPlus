//
//  HomeServiceImplementation.swift
//
//
//  Created by Mohamad Mustapha on 24/05/2024.
//

import OSNCore
import OSNNetwork
import Foundation

struct HomeServiceImplementation {

    let moviesService: MoviesService
    let seriesService: SeriesService

    public init(moviesService: MoviesService, seriesService: SeriesService) {
        self.moviesService = moviesService
        self.seriesService = seriesService
    }
}
