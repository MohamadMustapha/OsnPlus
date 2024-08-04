//
//  MyLibraryViewModel.swift
//
//
//  Created by Mohamad Mustapha on 04/08/2024.
//

import Foundation

final class MyLibraryViewModel: ObservableObject {

    enum UIState {

        struct MyLibraryModel {
            let watchlist: [Any]
        }
        case loading, loaded(model: MyLibraryModel), error
    }

    private(set) var state: UIState = .loaded(model: .init(watchlist: []))

    public init() {}
}
