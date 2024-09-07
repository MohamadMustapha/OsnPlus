//
//  SearchView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

public struct SearchView: View {

    typealias Model = SearchViewModel.SearchState

    @Bindable private var viewModel: SearchViewModel = .init()

    @FocusState private var isFocused: Bool

    public init() {}

    public var body: some View {
        VStack(spacing: .p5) {
            SearchBarView(searchText: $viewModel.searchText)
                .focused($isFocused)
                .onChange(of: isFocused) { focus in
                    viewModel.searchBarFocused = focus
                }
                .onChange(of: viewModel.searchText) {
                    viewModel.search(for: viewModel.searchText)
                }

            Group {
                switch viewModel.state {
                case .loading:
                    OsnLoader()
                case .loaded(let model):
                    loadedView(model: model)
                        .scrollDismissesKeyboard(.immediately)
                case .error:
                    ErrorView {
                        Task {
                            await viewModel.refresh()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .task {
            await viewModel.getTrending()
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .p5) {
                switch model {
                case .searchItems(let searches):
                    PixelText(configuration: .title, text: "Search results")
                    ItemsGridView(items: searches)

                case .trendingItems(let trendings):
                    PixelText(configuration: .title, text: "Trending Movies & Series")
                    ItemsGridView(items: trendings)

                case .noResults:
                    PixelText(configuration: .unavailable, text: "No results found.")

                case .popularTitles(let populars):
                    SearchPopularTitlesView(searchText: $viewModel.searchText, item: populars)
                }
            }
            .padding(.p10)
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.automatic)
    }
}

fileprivate extension PixelTextConfiguration {

    static var title: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big2),
              lineLimit: 1)
    }

    static var unavailable: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light8),
              fontStyle: .single(font: .medium2),
              lineLimit: 1)
    }
}

#Preview {
    SearchView()
}
