//
//  ContentView.swift
//  OsnPlus
//
//  Created by Mohamad Mustapha on 12/05/2024.
//

import Home
import OSNCore
import Pixel
import Profile
import Search
import SwiftUI

struct ContentView: View {

    private typealias Tab = BottomTabBarView.Tab

    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    pageView(tab: tab)
                        .tag(tab)
                }
            }
            BottomTabBarView(selectedTab: $selectedTab)
                .background(PixelColor.dark6)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    private func pageView(tab: Tab) -> some View {
        switch tab {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .library:
            MyLibraryView()
        }
    }
}

#Preview {
    ContentView()
}
