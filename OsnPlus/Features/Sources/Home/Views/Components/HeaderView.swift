//
//  HeaderView.swift
//
//
//  Created by Mohamad Mustapha on 18/05/2024.
//

import Kingfisher
import Pixel
import SwiftUI

struct HeaderView: View {

    let size: CGSize
    let safeArea: EdgeInsets

    let item: HeaderModel

    var body: some View {
        ZStack(alignment: .bottom) {
            let height = size.height * 0.6
            GeometryReader { proxy in
                let size = proxy.size
                let minY = proxy.frame(in: .named("SCROLL")).minY
                let progress = minY / height

                KFImage(URL(string: /*item.imageUrl*/ "https://image.tmdb.org/t/p/w500//d5NXSklXo0qyIYkgV94XAgMIckC.jpg"))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height + minY)
                    .clipped()
                    .overlay {
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [.black.opacity(0 - progress),
                                                        .black.opacity(0 - progress),
                                                        .black.opacity(0.1 - progress),
                                                        .black.opacity(0.2 - progress),
                                                        .black.opacity(0.6 - progress),
                                                        .black.opacity(1)],
                                               startPoint: .top, endPoint: .bottom))
                    }
                    .offset(y: -minY)
            }
            .frame(height: height + safeArea.top)

            HeaderActionsView(item: item)
        }
    }

    private var dark: PixelColorStyle {
        .single(color: PixelColor.dark8)
    }
}

#Preview {
    HomeView()
}
