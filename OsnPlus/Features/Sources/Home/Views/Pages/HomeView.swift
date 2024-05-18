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

                GenresPillView(isPresented: $isPresented, title: .constant("Series"))
            }
        }
        .blur(radius: isPresented ? 15 : 0)
    }
}

#Preview {
    HomeView()
}
