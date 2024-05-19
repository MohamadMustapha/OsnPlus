//
//  HomeView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import Pixel
import SwiftUI

public struct HomeView: View {

    @State private var isPresented: Bool = false

    public init() { }

    public var body: some View {
        Group {
            ZStack {
                PixelColor.dark8
                    .ignoresSafeArea()

                GeometryReader {
                    let safeArea = $0.safeAreaInsets
                    let size = $0.size
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack(alignment: .top) {
                            HeaderView(size: size, safeArea: safeArea, item: .init(id: 1, imageUrl: "", genres: ["Comedy", "Thriller"]))
                            GenresPillView(isPresented: $isPresented, title: .constant("Series"))
                                .padding(.vertical, safeArea.top)
                        }
                    }
                    .coordinateSpace(name: "SCROLL")
                    .ignoresSafeArea()
//                    .scrollBounceBehavior(.basedOnSize)
                }
            }
        }
        .blur(radius: isPresented ? 15 : 0)
    }
}

#Preview {
    HomeView()
}
