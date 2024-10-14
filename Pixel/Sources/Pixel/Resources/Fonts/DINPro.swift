//
//  DINPro.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import Foundation

struct DINPro {

    static let light: DINPro = .init(name: "DINPro-Light")
    static let regular: DINPro = .init(name: "DINPro")
    static let medium: DINPro = .init(name: "DINPro-Medium")
    static let bold: DINPro = .init(name: "DINPro-Bold")
    static let black: DINPro = .init(name: "DINPro-Black")

    let name: String

    private init(name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            fatalError("Failed to register font: \(name) with error: \(error)")
        }
    }
}
