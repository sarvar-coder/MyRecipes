//
//  Ingredients.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 30/05/25.
//

import Foundation
struct Ingredients: Identifiable {
    let id: UUID = .init()
    
    let ingredient: String
    let measure: String
}
