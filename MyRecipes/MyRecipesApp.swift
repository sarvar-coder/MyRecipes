//
//  MyRecipesApp.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import SwiftUI

@main
struct MyRecipesApp: App {
    let manager = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            RecipeView()
                .environment(\.managedObjectContext, manager.viewcontext)
                
        }
    }
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
