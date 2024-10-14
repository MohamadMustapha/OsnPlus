//
//  PixelImage.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelImage {

    public struct Icon {

        public struct Caregiver {

            public static var regular: Image { .init(.Icon.Caregiver.regular) }
        }

        public struct Cook {

            public static var regular: Image { .init(.Icon.Cook.regular) }
        }

        public struct Electrician {

            public static var regular: Image { .init(.Icon.Electrician.regular) }
        }

        public struct Gardener {

            public static var regular: Image { .init(.Icon.Gardener.regular) }
        }

        public struct Keeper {

            public static var regular: Image { .init(.Icon.Keeper.regular) }
        }

        public struct Plumber {

            public static var regular: Image { .init(.Icon.Plumber.regular) }
        }

        public struct Sweep {

            public static var regular: Image { .init(.Icon.Sweep.regular) }
        }
    }

    public struct Logo {

        public static var sweep: Image { .init(.Logo.sweep) }
    }
}

#Preview {
    VStack(spacing: .p10) {
        HStack(spacing: .p10) {
            PixelImage.Icon.Caregiver.regular

            PixelImage.Icon.Cook.regular

            PixelImage.Icon.Electrician.regular

            PixelImage.Icon.Gardener.regular

            PixelImage.Icon.Keeper.regular

            PixelImage.Icon.Plumber.regular

            PixelImage.Icon.Sweep.regular
        }

        HStack {
            PixelImage.Logo.sweep
                .resizable()
                .scaledToFit()
                .frame(width: 110)
        }
    }
}
