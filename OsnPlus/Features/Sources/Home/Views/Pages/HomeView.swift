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

    @Bindable private var viewModel: HomeViewModel = .init()

    @State private var isPresented: Bool = false

    public init() { }

    public var body: some View {
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
        .blur(radius: isPresented ? 10 : 0)
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {
        ZStack {
            PixelColor.dark8
                .ignoresSafeArea()

            GeometryReader {
                let safeArea = $0.safeAreaInsets
                let size = $0.size
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: .p10) {
                        HeaderView(size: size, safeArea: safeArea, item: model.headerItem)
                    }
                }
                .coordinateSpace(name: "SCROLL")
                .ignoresSafeArea()
                .scrollBounceBehavior(.basedOnSize)

                VStack(spacing: .p2) {
                    TopBarView(name: "Mohamad")
                    GenresPillView(isPresented: $isPresented, category: $viewModel.category)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
