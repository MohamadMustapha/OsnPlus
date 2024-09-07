//
//  DetailsDescriptionView.swift
//
//
//  Created by Mohamad Mustapha on 06/08/2024.
//

import Pixel
import SwiftUI

public struct DetailsDescriptionView: View {

    let genres: String
    let description: String

    public init(genres: String, description: String) {
        self.genres = genres
        self.description = description
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .p5) {
            PixelText(configuration: .genres, text: genres)
            PixelText(configuration: .description, text: description)
        }
    }
}

fileprivate extension PixelTextConfiguration {

    static var genres: PixelTextConfiguration {
        .init(alignment: .leading,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.small1),
              lineLimit: 1)
    }

    static var description: PixelTextConfiguration {
        .init(alignment: .leading,
              colorStyle: .single(color: PixelColor.light1),
              fontStyle: .single(font: PixelFont.small2),
              lineLimit: 1)
    }
}

#Preview {
    DetailsDescriptionView(genres: "Adventure . Comedy",
                           description: "To live in Barbie Land is to be a perfect")

}
