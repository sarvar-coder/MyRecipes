//
//  RobotoFont.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 30/05/25.
//

import Foundation

enum RobotoFont: String {
    case medium         = "RobotoCondensed-Medium"
    case mediumItalic   = "RobotoCondensed-MediumItalic"
    case semiBoldItalic = "RobotoCondensed-SemiBoldItalic"
    case semiBold       = "RobotoCondensed-SemiBold"
    case light          = "RobotoCondensed-Light"
    
    
    func rawValue(_ font: RobotoFont) -> String {
        font.rawValue
    }
}
