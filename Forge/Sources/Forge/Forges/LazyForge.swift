//
//  LazyForge.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 02/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

//@propertyWrapper
public struct LazyForge<Dependency> {

    private var dependency: Dependency!

    public init<C: ForgeSharedContainer>(_ keyPath: KeyPath<C, Dependency>) { }

//    public init<C:SharedContainer>(_ keyPath: KeyPath<C, Factory<T>>) {
//        self.reference = FactoryReference<C, T>(keypath: keyPath)
//    }
//
//    var wrappedValue: Dependency {
//        get { }
//        mutating set { }
//    }
}
