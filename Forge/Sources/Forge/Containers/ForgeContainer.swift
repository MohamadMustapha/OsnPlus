//
//  ForgeContainer.swift
//  Forge
//
//  Created by Khaled Chehabeddine on 03/06/2024.
//  Copyright © 2024 OSN+. All rights reserved.
//

import Foundation

public final class ForgeContainer: ForgeSharedContainer {
    
    public static let shared: ForgeContainer = .init()
    
    public let manager: ForgeContainerManager = .init()
    
    public init() { }
}
