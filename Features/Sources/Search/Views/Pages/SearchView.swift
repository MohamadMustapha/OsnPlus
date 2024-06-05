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
                .padding(.horizontal, .p10)

            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .loaded(let model):
                    loadedView(model: model)
                case .error:
                    EmptyView()
                }
            }
        }
        .onFirstAppear {
            await viewModel.onAppear()
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .p5) {
                PixelText(configuration: .title, text: "Trending Movies & Series")
                ItemsGridView(items: model.trendingItems)
            }
            .padding(.horizontal, .p10)
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
}
#Preview {
    SearchView()
}
