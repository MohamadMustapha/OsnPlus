//
//  DetailsViewModel.swift
//
//
//  Created by Mohamad Mustapha on 05/08/2024.
//

import Foundation

final class DetailsViewModel: ObservableObject {

    enum UIState {

        struct DetailsModel {

        }
        case loading, loaded(model: DetailsModel), error
    }

    @Published private(set) var state: UIState = .loading

    init() { }

    func onAppear() async {

    }
}
