//
//  MyDownloadsView.swift
//
//
//  Created by Mohamad Mustapha on 04/08/2024.
//

import OSNCore
import Pixel
import SwiftUI

struct MyDownloadsView: View {
    var body: some View {
        VStack {
            Button {
                print("my downloads")
            } label: {
                HStack(spacing: .p5) {

                    Image(systemName: "icloud.and.arrow.down.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(PixelColor.dark3)
                        .frame(width: 20, height: 20)
                        .padding(.p5)
                        .background(
                            Circle()
                                .fill(PixelColor.light1)
                        )

                    PixelText(configuration: .downloads, text: "My Downloads")

                    Spacer()

                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(PixelColor.light1)
                }
                .padding(.p8)
                .background(
                    RoundedRectangle(cornerRadius: .medium)
                        .fill(PixelColor.dark3)
                )
            }
            .buttonStyle(DecreaseSizeButtonStyle())
        }
        .padding(.horizontal, .p10)
    }
}

fileprivate extension PixelTextConfiguration {

    static var downloads: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.big1))
    }
}

#Preview {
    MyDownloadsView()
}
