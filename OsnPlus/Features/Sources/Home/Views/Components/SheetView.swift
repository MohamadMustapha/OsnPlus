//
//  SheetView.swift
//
//
//  Created by Mohamad Mustapha on 18/05/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct SheetView: View {

    @Binding var isPresented: Bool

    let items: [String]

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    // no idea how this line works but it fixed the centering for me
                    Spacer().containerRelativeFrame([.horizontal, .vertical])
                    VStack(spacing: .p20) {
                        ForEach(items, id: \.self) { item in
                            Button {
                                withAnimation {
                                    isPresented.toggle()
                                }
                            } label: {
                                PixelText(configuration: .genre, text: item)
                            }
                            .buttonStyle(DecreaseSizeButtonStyle())
                        }
                    }
                    .padding(.top, .p23)
                }
                
            }
            .scrollBounceBehavior(.basedOnSize)
            .fadeOutScrollView(fadeLength: 100)
            
            Button {
                withAnimation {
                    isPresented.toggle()
                }
            } label: {
                HStack(spacing: .p6) {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23, height: 23)
                        .fontWeight(.light)
                        .foregroundStyle(PixelColor.light1)
                    PixelText(configuration: .close, text: "Close")
                }
            }
            .buttonStyle(DecreaseSizeButtonStyle())
        }
        .frame(maxWidth: .infinity)
        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                if (-100...100).contains(value.translation.width) && value.translation.height > 0 {
                    withAnimation {
                        isPresented.toggle()
                    }
                }
            }
        )
    }
}

fileprivate extension PixelTextConfiguration {

    static var close: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .big3),
              lineLimit: 1)
    }
    static var genre: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: .dino5),
              lineLimit: 1)
    }
}

#Preview {
    SheetView(isPresented: .constant(true), items: ["Series", "Movies", "Arabic", "Kids & Family", "HBO", "Action", "Horror", "Comedy", "Romance", "Crime", "Sci-fi", "Drama"] )
        .background(.black)
}
