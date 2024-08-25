//
//  DetailsTitleView.swift
//
//
//  Created by Mohamad Mustapha on 06/08/2024.
//

import Pixel
import SwiftUI

struct DetailsTitleView: View {

    let title: String
    let year: Int
    let runtime: String
    var body: some View {
        VStack(spacing: .p5) {
            PixelText(configuration: .title, text: title)
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var title: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.big3))
    }
    static var info: PixelTextConfiguration {
        .init(alignment: .center,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.small2))
    }
}

#Preview {
    DetailsTitleView(title: "Barbie", year: 2023, runtime: "1h 49m")
}
