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
        }

        case loading, loaded(model: SearchModel), error
    }
    
    private var service: SearchService = SearchServiceImplementation(moviesApi: HttpMoviesApi(),
                                                                     seriesApi: HttpSeriesApi())

    private(set) var state: UIState = .loaded(model: .init(trendingItems: [.mock]))

    var searchText: String = ""

    init() { }

    func onAppear() async {
        do {
            let trendingItems: [ItemModel] = try await service.getAllTrending()

            let model: UIState.SearchModel = .init(trendingItems: trendingItems)

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
}
