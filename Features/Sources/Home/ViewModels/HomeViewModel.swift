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
final class HomeViewModel {

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
    private var movieSections: [ItemsCarouselModel]?
    private var movieHeader: HeaderModel?
    private var seriesSections: [ItemsCarouselModel]?
    private var seriesHeader: HeaderModel?

    var category: Category = .movies {
        didSet {
            Task {
                await onAppear()
            }
        }
    }

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
        let sections: [ItemsCarouselModel]
        let header: HeaderModel

        switch category {
        case .movies:
            (sections, header) = try await getCategoryData(sections: movieSections,
                                                           header: movieHeader,
                                                           sectionTypes: MovieSections.allCases,
                                                           defaultHeader: 533535)
            movieSections = sections
            movieHeader = header

        case .series:
            (sections, header) = try await getCategoryData(sections: seriesSections,
                                                           header: seriesHeader,
                                                           sectionTypes: SeriesSections.allCases,
                                                           defaultHeader: 94997)
            seriesSections = sections
            seriesHeader = header
        }
        return UIState.HomeModel(headerItem: header, sections: sections)
    }


    private func getCategoryData(sections: [ItemsCarouselModel]?,
                                  header: HeaderModel?,
                                  sectionTypes: [Section],
                                  defaultHeader: Int) async throws -> ([ItemsCarouselModel], HeaderModel) {

        if let loadedSections = sections, let loadedHeader = header {
            return (loadedSections, loadedHeader)
        } else {
            // Load sections
            let sections: [ItemsCarouselModel] = try await getSections(from: sectionTypes)
            // select random item from top 10
            let id: Int = sections.first(where: {$0.type == .charts})?.items.randomElement()?.id ?? defaultHeader
            // load header info
            let header: HeaderModel = try await getHeader(of: category, by: id)
            return (sections, header)
        }
    }
    
    private func getSections(from tasks: [Section]) async throws -> [ItemsCarouselModel] {
        return try await withThrowingTaskGroup(of: ItemsCarouselModel.self,
                                               returning: [ItemsCarouselModel].self) { taskGroup in
            for task in tasks {
                taskGroup.addTask {
                    let items = try await task.fetch(using: self.service)
                    return ItemsCarouselModel(
                        type: task.type,
                        headline: task.rawValue,
                        // need to shuffle the items always because of online API discrepancies, however top 10 api is correct so don't shuffle
                        items: task.type == .charts ? Array(items.prefix(10)) : items.shuffled()
                    )
                }
            }

            var sections: [ItemsCarouselModel] = []
            while let result = try await taskGroup.next() {
                sections.append(result)
            }
            return sections
        }
    }

    private func getHeader(of category: Category, by id: Int) async throws -> HeaderModel {
        switch category {
        case .movies:
            return try await service.moviesService.getMovieHeader(by: id)
        case .series:
            return try await service.seriesService.getSeriesHeader(by: id)
        }
    }
}
