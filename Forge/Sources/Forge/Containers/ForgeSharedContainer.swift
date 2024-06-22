//
//  ForgeSharedContainer.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 01/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

public protocol ForgeSharedContainer: ForgeManagedContainer {

    static var shared: Self { get }
}
