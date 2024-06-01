//
//  SearchBarView.swift
//
//
//  Created by Mohamad Mustapha on 29/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct SearchBarView: View {

    @FocusState private var isFocused: Bool

    @Binding var searchText: String

    var body: some View {
        HStack(spacing: .p7) {
            HStack(spacing: .p5) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(PixelColor.dark8)
                    .fontWeight(.regular)

                TextField(text: $searchText.animation(.smooth)) {
                    PixelText(configuration: .placeholder(if: isFocused),
                              text: "Series, Movies, and more...")
                }
                .focused($isFocused)
                .foregroundStyle(PixelColor.dark8)
                .font(PixelFont.medium3.font)

                Spacer()

                Button {
                    withAnimation {
                        searchText.removeAll(keepingCapacity: true)
                    }
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(PixelColor.light8)
                }
                .buttonStyle(DecreaseSizeButtonStyle())
                .isHidden(searchText.isEmpty, remove: searchText.isEmpty)
                .transition(.scale)

            }
            .padding(.p7)
            .background (
                RoundedRectangle(cornerRadius: .medium)
                    .fill(PixelColor.light1)
            )

            Button {
                withAnimation {
                    isFocused.toggle()
                    searchText.removeAll(keepingCapacity: true)
                }
            } label: {
                PixelText(configuration: .cancel, text: "Cancel")
            }
            .buttonStyle(DecreaseSizeButtonStyle())
            .isHidden(!isFocused, remove: !isFocused)
            // animation bug
            .transition(.asymmetric(insertion: .move(edge: .trailing),
                                    removal: .move(edge: .trailing)).combined(with: .opacity))
            .animation(.smooth, value: isFocused)
        }
        .animation(.smooth, value: isFocused)
    }
}

fileprivate extension PixelTextConfiguration {

    static func placeholder(if isFocused: Bool) -> PixelTextConfiguration {
        return .init(alignment: .leading,
                     colorStyle: .conditional(activeColorStyle: .single(color: PixelColor.light7),
                                              inactiveColorStyle: .single(color: PixelColor.dark8),
                                              isActive: isFocused),
                     fontStyle: .single(font: .medium3),
                     lineLimit: 1)
    }

    static var cancel: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big3),
              lineLimit: 1)
    }
}

#Preview {
    ZStack {
        Color.gray

        VStack {
            SearchBarView(searchText: .constant(""))
                .padding(.p5)

            SearchBarView(searchText: .constant("Batman"))
                .padding(.p5)
        }

    }

}
