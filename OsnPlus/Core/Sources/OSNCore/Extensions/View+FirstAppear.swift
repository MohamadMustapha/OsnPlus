//
//  View+FirstAppear.swift
//
//
//  Created by Mohamad Mustapha on 27/05/2024.
//

import SwiftUI

public extension View {

    @ViewBuilder
    func onFirstAppear(_ action: @escaping () async -> Void) -> some View {
        self.modifier(FirstAppear(action: action))
    }
}

private struct FirstAppear: ViewModifier {

    @State private var didAppear: Bool = false

    let action: () async -> Void

    func body(content: Content) -> some View {
        content.task {
            guard !didAppear else { return }
            didAppear = true
            await action()
        }
    }
}
