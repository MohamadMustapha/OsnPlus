//
//  Forge.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 01/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Forge<Value> {

    private let keyPath: WritableKeyPath<ForgeValues, Value>

    public init(_ keyPath: WritableKeyPath<ForgeValues, Value>) {
        self.keyPath = keyPath
    }

    public var wrappedValue: Value {
        get { ForgeValues[keyPath] }
        set { ForgeValues[keyPath] = newValue }
    }
}
