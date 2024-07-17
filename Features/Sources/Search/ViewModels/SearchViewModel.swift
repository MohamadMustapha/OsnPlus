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
    
    private var service: SearchService = SearchServiceImplementation(moviesApi: HttpMoviesApi(),
                                                                     seriesApi: HttpSeriesApi())

    private(set) var state: UIState = .loading
    private(set) var trendingItems: [ItemModel] = []
//    private(set) var cancellables: Set<AnyCancellable> = .init()

    var searchText: String = ""

    init() {
        Task {
            await getTrending()
        }
    }

    func getTrending() async {
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
//            withAnimation {
//                state = .loading
//            }
            let searchItems: [ItemModel] = try await service.getSearch(query: searchText)

            let model: UIState.SearchModel = .init(trendingItems: trendingItems, searchItems: searchItems)

            withAnimation {
                state = .loaded(model: model)
            }
        } catch {
            print(error)
            state = .error
        }
    }

//    private func searchPipeline() {
//        searchPublisher
//            .removeDuplicates()
//            .debounce(for: 0.5, scheduler: DispatchQueue.main)
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("finished")
//                case .failure(let failure):
//                    print(failure.localizedDescription)
//                    self.state = .error
//                }
//
//            } receiveValue: { [weak self] _ in
//                Task {
//                    await self?.search() // how to run the search function in this block
//                }
//            }
//            .store(in: &cancellables)
//    }
}
