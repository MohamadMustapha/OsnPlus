//
//  DetailsImageView.swift
//
//
//  Created by Mohamad Mustapha on 06/08/2024.
//

import Kingfisher
import SwiftUI

struct DetailsImageView: View {

    let imageUrl: String

    var body: some View {
        VStack {
            KFImage(.init(string: imageUrl))
        }
    }
}

#Preview {
    DetailsImageView(imageUrl: "")
}
