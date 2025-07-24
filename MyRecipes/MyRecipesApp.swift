//
//  MyRecipesApp.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import SwiftUI

@main
struct MyRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeView()
        }
    }
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
