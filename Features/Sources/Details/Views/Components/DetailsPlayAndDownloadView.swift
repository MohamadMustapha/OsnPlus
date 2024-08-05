//
//  DetailsPlayAndDownloadView.swift
//
//
//  Created by Mohamad Mustapha on 06/08/2024.
//

import OSNCore
import Pixel
import SwiftUI

public struct DetailsPlayAndDownloadView: View {

    public init() {}
    
    public var body: some View {
        VStack(spacing: .p5) {
            Button {
                print("Play")
            } label: {
                HStack(spacing: .p5) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 15, height: 15)

                    PixelText(configuration: .play, text: "Play")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.p5)
                .background(
                    Capsule()
                        .fill(PixelColor.light1)
                )
            }
            .buttonStyle(DecreaseSizeButtonStyle())

            Button {
                print("Download")
            } label: {
                HStack(alignment: .center, spacing: .p5) {
                    Image(systemName: "icloud.and.arrow.down")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 15, height: 15)
                        .offset(y: 2)

                    PixelText(configuration: .download, text: "Download")
                }
                .frame(maxWidth: .infinity)
                .padding(.p5)
                .background(
                    Capsule()
                        .fill(PixelColor.dark3)
                )
            }
            .buttonStyle(DecreaseSizeButtonStyle())
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var play: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.dark8),
              fontStyle: .single(font: PixelFont.medium1))
    }

    static var download: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.medium1))
    }
}

#Preview {
    DetailsPlayAndDownloadView()
}
