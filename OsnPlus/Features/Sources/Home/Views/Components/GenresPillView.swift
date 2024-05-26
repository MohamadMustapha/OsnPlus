//
//  GenresPillView.swift
//
//
//  Created by Mohamad Mustapha on 17/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct GenresPillView: View {

    @Binding var isPresented: Bool

    @Binding var category: Category

    private static let genres: [String] = ["Series", "Movies",
                                           "Arabic", "Kids & Family",
                                           "HBO", "Action",
                                           "Horror", "Comedy",
                                           "Romance", "Crime",
                                           "Sci-fi", "Drama",
                                           "Documentary", "Reality",
                                           "Lifestyle"]

    var body: some View {
        HStack(alignment: .center, spacing: .p7) {
            Button {
                withAnimation {
                    category = category == .movies ? .series : .movies
                }
            } label: {
                PixelText(configuration: .pill, text: category.rawValue)
                    .transparentButtonStyle(colorStyle: pillColorStyle, type: .capsule)
            }
            .buttonStyle(PixelSizeButtonStyle())

            Button {
                withAnimation {
                    isPresented.toggle()
                }
            } label: {
                HStack(alignment: .top, spacing: .p3) {
                    PixelText(configuration: .pill, text: "More")
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(pillColorStyle.color)
                        .fontWeight(.semibold)
                        .frame(width: 9, height: 9)
                        .offset(y: 4)
                }
                .transparentButtonStyle(colorStyle: pillColorStyle, type: .capsule)
            }
            .buttonStyle(PixelSizeButtonStyle())
            .fullScreenCover(isPresented: $isPresented) {
                SheetView(isPresented: $isPresented, items: Self.genres)
                    .presentationBackground(PixelColor.dark6.opacity(0.9))
            }

            Spacer()
        }
        .padding(.horizontal, .p10)
    }

    private var pillColorStyle: PixelColorStyle {
        .single(color: PixelColor.light1)
    }
}

fileprivate extension PixelTextConfiguration {

    static var pill: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .small1))
    }
}

#Preview {
    ZStack {
        PixelColor.dark8
        GenresPillView(isPresented: .constant(false), category: .constant(.movies))
    }
    .ignoresSafeArea()
}
