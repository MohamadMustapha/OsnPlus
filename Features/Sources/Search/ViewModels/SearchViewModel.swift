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

    enum SearchState {

        case searchItems([ItemModel])
        case trendingItems([ItemModel])
        case noResults
    }

    enum UIState {

        case loading, loaded(model: SearchState), error
    }

    private var service: SearchService = SearchServiceImplementation(moviesApi: HttpMoviesApi(), seriesApi: HttpSeriesApi())
    private(set) var state: UIState = .loading
    private(set) var trendingItems: [ItemModel] = []
    private(set) var searchItems: [ItemModel] = []
    private var currentTask: Task<Void, Never>? = nil

    var searchText: String = ""
    
    init() {}

    func refresh() async {
        await getTrending()
    }

    func getTrending() async {
        do {
            if trendingItems.isEmpty {
                let items = try await service.getAllTrending()
                trendingItems = items
            }

            withAnimation {
                computeState()
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
        if searchText.count == 0 {
            searchItems = []

            withAnimation {
                computeState()
            }
        } else {
            currentTask = Task {
                do {
                    log("Started search for \(searchText)")
                    let items: [ItemModel] = try await service.getSearch(query: searchText)
                    log("Ended search for \(searchText)")
                    searchItems = items

                    withAnimation {
                        computeState()
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
    }

    func computeState() {
        if searching && searchItems.isEmpty {
            state = .loaded(model: .noResults)
        } else {
            state = .loaded(model: searchItems.isEmpty ? .trendingItems(trendingItems) : .searchItems(searchItems))
        }
    }

    private var searching: Bool {
        return searchText.count > 0
    }

    private func log(_ message: String) {
        print("\(Date()): \(message)")
    }
}
