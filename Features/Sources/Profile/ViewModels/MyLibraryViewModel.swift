//
//  MyLibraryViewModel.swift
//
//
//  Created by Mohamad Mustapha on 04/08/2024.
//

import OSNCore
import Foundation

final class MyLibraryViewModel: ObservableObject {

    enum UIState {

        struct MyLibraryModel {
            let watchlist: [ItemModel]
        }
        case loading, loaded(model: MyLibraryModel), error
    }

    @Published private(set) var state: UIState = .loaded(model: .init(watchlist: []))

    init() {}
}
