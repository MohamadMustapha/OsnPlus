//
//  Forge.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 01/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import SwiftUI

@propertyWrapper
public struct Forge<Dependency> {

    private var dependency: Dependency

    public init(_ keyPath: KeyPath<ForgeContainer, Dependency>) {
        self.dependency = ForgeContainer.shared[keyPath: keyPath]
    }
    
    public init<C: ForgeSharedContainer>(_ keyPath: KeyPath<C, Dependency>) {
        self.dependency = C.shared[keyPath: keyPath]
    }

    public var wrappedValue: Dependency {
        get { dependency }
        mutating set { dependency = newValue }
    }
}
