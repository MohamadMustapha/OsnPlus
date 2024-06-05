//
//  HomeViewModel.swift
//
//
//  Created by Mohamad Mustapha on 19/05/2024.
//

import Observation
import OSNCore
import OSNNetwork
import SwiftUI

@Observable
class HomeViewModel {

    enum ViewModelError: Error {

        case invalidHeader
        case failedToLoad
    }

    enum UIState {

        struct HomeModel {
            let headerItem: HeaderModel
            let sections: [ItemsCarouselModel]

        }
        case loading, loaded(model: HomeModel), error
    }

    @ObservationIgnored private let service: HomeServiceImplementation = .init(moviesService: MoviesServiceImplementation(api: HttpMoviesApi()),
                                                                               seriesService: SeriesServiceImplementation(api: HttpSeriesApi()))

    private(set) var state: UIState = .loading
    // TODO: fix bug of category not updating on binding change
    var category: Category = .movies

    init() { }

    func onAppear() async {
        do {
            let model: UIState.HomeModel = try await loadData(for: category)
            withAnimation {
                state = .loaded(model: model)
            }
        } catch {
            print(ViewModelError.failedToLoad)
            withAnimation {
                state = .error
            }
        }
    }

    private func loadData(for category: Category) async throws -> UIState.HomeModel {
        let tasks: [Section] = {
            switch category {
            case .movies:
                return MovieSections.allCases
            case .series:
                return SeriesSection.allCases
            }
        }()

        let sections: [ItemsCarouselModel] = try await getSections(from: tasks)
        let header: HeaderModel = .init(id: 1,
                                            imageUrl: "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
                                            genres: ["Comedy", "Thriller"])

        return UIState.HomeModel(headerItem: header, sections: sections)
    }

    // TODO: fix bug of Sections returning in different order
    private func getSections(from tasks: [Section]) async throws -> [ItemsCarouselModel] {
        var sections: [ItemsCarouselModel] = []
        sections.reserveCapacity(tasks.count)

        sections.append(
            contentsOf: try await withThrowingTaskGroup(
                of: ItemsCarouselModel.self,
                returning: [ItemsCarouselModel].self) { taskGroup in
                    for task in tasks {
                        taskGroup.addTask {
                            let items = try await task.fetch(using: self.service)
                            return .init(type: task.type,
                                         headline: task.rawValue,
                                         items: task.type == .charts ? Array(items.prefix(upTo: 10)) : items.shuffled()) // need to shuffle the items always because of online API discrepancies, however top 10 api is correct so don't shuffle
                        }
                    }
                    var results: [ItemsCarouselModel] = []
                    while let response: ItemsCarouselModel = try await taskGroup.next() {
                        results.append(response)
                    }
                    return results
                }
        )
        return sections
    }
}
