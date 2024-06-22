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
        guard lhs.type == rhs.type && lhs.id.hasPointerRepresentation == rhs.id.hasPointerRepresentation else {
            return false
        }
        
        return lhs.id.hasPointerRepresentation
        ? lhs.id.utf8Start == rhs.id.utf8Start
        : lhs.id.unicodeScalar == rhs.id.unicodeScalar
    }
    
    let id: StaticString
    let type: ObjectIdentifier
    
    init(id: StaticString, type: Any.Type) {
        self.id = id
        self.type = .init(type)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        id.hasPointerRepresentation
        ? hasher.combine(bytes: .init(start: id.utf8Start, count: id.utf8CodeUnitCount))
        : hasher.combine(id.unicodeScalar.value)
    }
}
