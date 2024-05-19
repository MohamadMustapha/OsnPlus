//
//  HomeViewModel.swift
//
//
//  Created by Mohamad Mustapha on 19/05/2024.
//

import Observation
import SwiftUI

@Observable
class HomeViewModel {

    enum Category: String {
        case movies = "Movies"
        case series = "Series"
    }

    enum UIState {

        struct HomeModel {
            let headerItem: HeaderModel
        }
        case loading, loaded(model: HomeModel), error
    }

    private(set) var state: UIState = .loading

    var category: Category = .movies

    init() { }

    func onAppear() {
        let headerItem: HeaderModel = .init(id: 1,
                                            imageUrl: "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
                                            genres: ["Comedy", "Thriller"])

        withAnimation {
            state = .loaded(model: .init(headerItem: headerItem))
        }
    }
}
