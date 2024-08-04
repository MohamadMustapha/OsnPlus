//
//  MyLibraryView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import OSNCore
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
        VStack {
            ScrollView {

            }
            .scrollBounceBehavior(.basedOnSize)
        }

    }
}

#Preview {
    MyLibraryView()
}
