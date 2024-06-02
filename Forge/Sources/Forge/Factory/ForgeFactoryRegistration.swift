//
//  ForgeFactoryRegistration.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 02/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

public struct ForgeFactoryRegistration<Parameter, Dependency> {

    let container: ForgeManagedContainer
    let resolver: (Parameter) -> Dependency
}
