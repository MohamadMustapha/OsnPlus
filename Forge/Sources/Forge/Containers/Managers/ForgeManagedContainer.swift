//
//  ForgeManagedContainer.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 02/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

public protocol ForgeManagedContainer: Sendable {

    var manager: ForgeContainerManager { get }
}
