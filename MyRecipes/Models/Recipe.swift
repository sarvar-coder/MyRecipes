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
    
    init(id: String, name: String, category: String, country: String, instructions: String, image: String, tag: String, video: String, ingredients: [String], measurements: [String], source: String) {
        self.id = id
        self.name = name
        self.category = category
        self.country = country
        self.instructions = instructions
        self.image = image
        self.tag = tag
        self.video = video
        self.ingredients = ingredients
        self.measurements = measurements
        self.source = source
    }
    
    init(favouriteRecipe: FavouriteRecipe) {
       self.init(id: favouriteRecipe.id,
                 name: favouriteRecipe.name,
                 category: favouriteRecipe.category,
                 country: favouriteRecipe.country,
                 instructions: favouriteRecipe.instruction,
                 image: favouriteRecipe.image,
                 tag: favouriteRecipe.tag,
                 video: favouriteRecipe.video,
                 ingredients: [""],
                 measurements: [""],
                 source: "")
    }
    
    func extractID() -> String {
        guard let equalSign = video.firstIndex(of: "=") else { return "" }
        
        let equalSignIndex = video.index(after: equalSign)
        let endIndex = video.endIndex
        let id = video[equalSignIndex..<endIndex]
//        print(String(id))
        return String(id)
    }
    
    func ingredMeasure() -> [Ingredients] {
        let ingredients = zip(ingredients, measurements).map { Ingredients(ingredient: $0.0, measure: $0.1) }
        return ingredients.filter { ingredient in
            ingredient.ingredient != "" && ingredient.measure != ""
        }
    }
}
