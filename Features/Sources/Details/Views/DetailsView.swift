//
//  DetailsView.swift
//
//
//  Created by Mohamad Mustapha on 05/08/2024.
//

import Pixel
import SwiftUI

public struct DetailsView: View {

    public init() { }

    public var body: some View {
        VStack(alignment: .leading) {
            DetailsPlayAndDownloadView()
            DetailsDescriptionView(genres: "sds", description: "vsdvs")
        }
    }
}

#Preview {
    DetailsView()
}
