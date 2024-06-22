//
//  ForgeFactoryResolver.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 02/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

public struct ForgeFactoryResolver<Parameter, Dependency> {

    let container: ForgeManagedContainer
    let key: ForgeKey
    
    let factory: (Parameter) -> Dependency
    
    init(container: ForgeManagedContainer, id: StaticString, factory: @escaping (Parameter) -> Dependency) {
        self.container = container
        self.key = .init(id: id, type: Dependency.self)
        self.factory = factory
    }
}
