//
//  SearchViewModel.swift
//
//
//  Created by Mohamad Mustapha on 05/06/2024.
//

import Combine
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

    private var service: SearchService = SearchServiceImplementation(moviesApi: HttpMoviesApi(), seriesApi: HttpSeriesApi())
    private(set) var state: UIState = .loading
    private(set) var trendingItems: [ItemModel]?
    private var currentTask: Task<Void, Never>? = nil

    var searchText: String = ""
    
    init() {}

    func refresh() async {
        !searchText.isEmpty ? search(for: searchText) : await getTrending()
    }

    func getTrending() async {
        do {
            var model: UIState.SearchModel

            if let items = trendingItems {
                model = .init(trendingItems: items, searchItems: [])
            } else {
                let items = try await service.getAllTrending()
                trendingItems = items
                model = .init(trendingItems: items , searchItems: [])
            }

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

    func search(for searchText: String) {
        currentTask?.cancel()
        currentTask = Task {
            do {
                log("Started search for \(searchText)")
                let searchItems: [ItemModel] = try await service.getSearch(query: searchText)
                log("Ended search for \(searchText)")
                let model: UIState.SearchModel = .init(trendingItems: trendingItems ?? [], searchItems: searchItems)

                withAnimation {
                    state = .loaded(model: model)
                }
            } catch {
                if let _ = error as? CancellationError {
                    log("Searching for \(searchText) cancelled")
                } else if let urlError = error as? URLError, urlError.code == .cancelled {
                    log("Searching for \(searchText) cancelled by URLError")
                } else {
                    log("Error searching for \(searchText): \(error.localizedDescription)")
                    withAnimation {
                        state = .error
                    }
                }
            }
        }
    }

    private func log(_ message: String) {
        print("\(Date()): \(message)")
    }
}
