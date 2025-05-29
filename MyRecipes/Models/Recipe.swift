//
//  Recipe.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import Foundation

struct Recipe: Identifiable, Equatable {
    let id: String
    let name: String
    let category: String
    let country: String
    let instructions: String
    let image: String
    let tag: String
    let video: String
    let ingredients: [String]
    let measurements: [String]
    let source: String
}
