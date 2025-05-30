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
    
    func extractID() -> String {
        guard let equalSign = video.firstIndex(of: "=") else { return "" }
        
        let equalSignIndex = video.index(after: equalSign)
        let endIndex = video.endIndex
        let id = video[equalSignIndex..<endIndex]
        
        return String(id)
    }
    
    func ingredMeasure() -> [Ingredients] {
        zip(ingredients, measurements).map { Ingredients(ingredient: $0.0, measure: $0.1) }
    }
}
