//
//  OsnLoader.swift
//
//
//  Created by Mohamad Mustapha on 06/06/2024.
//

import Lottie
import SwiftUI

public struct OsnLoader: View {

    public init() { }

    public var body: some View {
        LottieView(animation: LottieAnimation.asset("Loader", bundle: .module))
            .playing(loopMode: .loop)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

#Preview {

    OsnLoader()
}
