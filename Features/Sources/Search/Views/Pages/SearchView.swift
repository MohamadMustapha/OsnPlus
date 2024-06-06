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

    typealias Model = SearchViewModel.UIState.SearchModel

    @Bindable private var viewModel: SearchViewModel = .init()

    public init() {}

    public var body: some View {
        VStack(spacing: .p5) {
            SearchBarView(searchText: $viewModel.searchText)
//                .onChange(of: viewModel.searchText) { newValue in
//                    print(newValue)
//                    Task {
//                        if searching {await viewModel.search()}
//                    }
//                }
            Group {
                switch viewModel.state {
                case .loading:
                    OsnLoader()
                case .loaded(let model):
                    loadedView(model: model)
                case .error:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .p5) {
                    // TODO: animation bug
                PixelText(configuration: .title, text: searching ? "Search results" : "Trending Movies & Series")
                ItemsGridView(items: searching ? model.searchItems : model.trendingItems)
            }
            .padding(.p10)
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.automatic)
    }

    private var searching: Bool {
        return viewModel.searchText.count > 1
    }
}

fileprivate extension PixelTextConfiguration {

    static var title: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big2),
              lineLimit: 1)
    }
}
#Preview {
    SearchView()
}
