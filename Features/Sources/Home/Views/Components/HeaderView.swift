//
//  HeaderView.swift
//
//
//  Created by Mohamad Mustapha on 18/05/2024.
//

import Kingfisher
import OSNCore
import Pixel
import SwiftUI

struct HeaderView: View {

    let size: CGSize
    let safeArea: EdgeInsets

    let item: HeaderModel

    var body: some View {
        ZStack(alignment: .bottom) {
            let height = size.height * 0.7
            GeometryReader {
                let size = $0.size
                let minY = $0.frame(in: .named("SCROLL")).minY
                let progress = minY / height

                KFImage(.init(string: item.imageUrl))
                    .placeholder {
                        OsnLoader()
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
