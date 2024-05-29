//
//  SearchView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import SwiftUI

public struct SearchView: View {

    @State private var searchText: String = ""

    public init() {}

    public var body: some View {
        VStack {

            SearchBarView(searchText: $searchText)
        }
    }
}

#Preview {
    SearchView()
}
