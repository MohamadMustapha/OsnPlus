//
//  ForgeValues.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 01/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import SwiftUI

public struct ForgeValues {

    private static var current: Self = .init()

    public static subscript<K: ForgeKey>(key: K.Type) -> K.Value {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    public static subscript<V>(_ keyPath: WritableKeyPath<ForgeValues, V>) -> V {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
