//
//  View+Visibility.swift
//
//
//  Created by Mohamad Mustapha on 21/05/2024.
//

import SwiftUI

public extension View {

    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if !remove {
            if hidden {
                self.hidden()
            } else {
                self
            }
        }
    }
}
