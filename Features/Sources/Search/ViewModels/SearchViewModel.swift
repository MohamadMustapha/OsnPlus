//
//  SearchViewModel.swift
//
//
//  Created by Mohamad Mustapha on 05/06/2024.
//

import Observation
import OSNCore
import OSNNetwork
import SwiftUI

@Observable
final class SearchViewModel {
    
    enum UIState {

        struct SearchModel {
            let trendingItems: [ItemModel]
            let searchItems: [ItemModel]
        }

        case loading, loaded(model: SearchModel), error
    }
    
    private var service: SearchService = SearchServiceImplementation(moviesApi: HttpMoviesApi(),
                                                                     seriesApi: HttpSeriesApi())

    private(set) var state: UIState = .loading
    private(set) var trendingItems: [ItemModel] = []

    var searchText: String = ""

    init() {
        Task {
            await getTrending()
        }
    }

     private func getTrending() async {
        do {
            trendingItems = try await service.getAllTrending()

            let model: UIState.SearchModel = .init(trendingItems: trendingItems, searchItems: [])

            withAnimation {
                state = .loaded(model: model)
            }
        } catch {
            print(error)
            withAnimation {
                state = .error
            }
        }
    }

    func search() async {
        do {
            let searchItems: [ItemModel] = try await service.searchQuery(query: searchText)

            let model: UIState.SearchModel = .init(trendingItems: trendingItems, searchItems: searchItems)

            withAnimation {
                state = .loaded(model: model)
            }
        } catch {
            print(error)
            state = .error
        }
    }
}
