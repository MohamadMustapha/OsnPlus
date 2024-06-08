//
//  HomeView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

public struct HomeView: View {

    typealias Model = HomeViewModel.UIState.HomeModel

    @State private var viewModel: HomeViewModel = .init()

    @State private var isPresented: Bool = false

    public init() { }

    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                OsnLoader()
            case .loaded(let model):
                loadedView(model: model)
                    .background(
                        PixelColor.dark8
                            .ignoresSafeArea())
            case .error:
                ErrorView {
                    Task {
                        await viewModel.onAppear()
                    }
                }
            }
        }
        .blur(radius: isPresented ? 10 : 0)
        .onFirstAppear {
            await viewModel.onAppear()
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {

        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: .p15) {
                    HeaderView(size: size, safeArea: safeArea, item: model.headerItem)

                    ForEach(model.sections, id: \.id) { section in
                        ItemsCarouselView(carousel: section)
                    }
                }
                .padding(.bottom, .p10)
            }
            .coordinateSpace(name: "SCROLL")
            .ignoresSafeArea(.all, edges: [.top])
            .scrollBounceBehavior(.basedOnSize)

            VStack(spacing: .p2) {
                TopBarView(name: "Mohamad")
                GenresPillView(isPresented: $isPresented, category: $viewModel.category)
            }
        }
    }
}

#Preview {
    HomeView()
}
