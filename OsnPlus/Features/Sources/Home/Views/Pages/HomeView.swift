//
//  HomeView.swift
//
//
//  Created by Mohamad Mustapha on 16/05/2024.
//

import Pixel
import SwiftUI

public struct HomeView: View {

    public init() { }

    public var body: some View {
        Group {
            ZStack {
                PixelColor.dark8
                    .ignoresSafeArea()
                GenresPillView(title: .constant("Series"))
            }
        }
    }
}

#Preview {
    HomeView()
}
