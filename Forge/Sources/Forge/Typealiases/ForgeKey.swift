//
//  ForgeKey.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 03/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

struct ForgeKey: Hashable {
    
    static func == (lhs: ForgeKey, rhs: ForgeKey) -> Bool {
        guard lhs.type == rhs.type && lhs.key.hasPointerRepresentation == rhs.key.hasPointerRepresentation else {
            return false
        }
        
        return lhs.key.hasPointerRepresentation
        ? lhs.key.utf8Start == rhs.key.utf8Start
        : lhs.key.unicodeScalar == rhs.key.unicodeScalar
    }
    
    let key: StaticString
    let type: ObjectIdentifier
    
    init(key: StaticString, type: Any.Type) {
        self.key = key
        self.type = .init(type)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        key.hasPointerRepresentation
        ? hasher.combine(bytes: .init(start: key.utf8Start, count: key.utf8CodeUnitCount))
        : hasher.combine(key.unicodeScalar.value)
    }
}
