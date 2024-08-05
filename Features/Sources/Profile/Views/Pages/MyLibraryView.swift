//
//  MyLibraryView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

public struct MyLibraryView: View {

    typealias Model = MyLibraryViewModel.UIState.MyLibraryModel

    @StateObject private var viewModel: MyLibraryViewModel = .init()

    public init() { }

    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                OsnLoader()
            case .loaded(let model):
                loadedView(model: model)
            case .error:
                ErrorView {
                    print("error")
                }
            }
        }
    }

    @ViewBuilder
    func loadedView(model: Model) -> some View {
        VStack(spacing: .p10) {
            TopBarView(model: .init(name: "Mohamad", toolbar: [.cast, .settings]))
            ScrollView {
                VStack(spacing: .p10) {
                    MyDownloadsView()
                    VStack(alignment: .leading, spacing: .p5) {
                        PixelText(configuration: .list, text: "My List")
                            .padding(.horizontal, .p10)
                        if model.watchlist.isEmpty {
                            // TODO: fix alignement
                            EmptyListView()
                        } else {
                            ItemsGridView(items: model.watchlist)
                        }
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var list: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.big1))
    }
}

#Preview {
    MyLibraryView()
}
