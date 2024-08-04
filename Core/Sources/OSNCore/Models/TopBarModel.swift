//
//  TopBarModel.swift
//
//
//  Created by Mohamad Mustapha on 05/08/2024.
//

import Foundation

public struct TopBarModel {

    public enum ToolbarItems: String {
        case cast = "airplayvideo"
        case settings = "gearshape"
    }
    
    public let name: String
    public let toolbar: [ToolbarItems]

    public init(name: String, toolbar: [ToolbarItems]) {
        self.name = name
        self.toolbar = toolbar
    }
}
